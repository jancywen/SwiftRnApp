
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    ScrollView,
    TouchableHighlight
} from 'react-native';

import {
    NativeModules,
    NativeAppEventEmitter
} from 'react-native';

var subscription;
var CalendarManager = NativeModules.CalendarManager;


class CustomButton extends React.Component {
    render() {
        return (
            <TouchableHighlight
                style={{padding: 8, backgroundColor:this.props.backgroundColor}}
                underlayColor="#a5a5a5"
                onPress={this.props.onPress}>
                <Text>{this.props.text}</Text>
            </TouchableHighlight>
        );
    }
}

class ModulesDemo extends Component {

    constructor(props){
        super(props);
        this.state={
            events:'',
            notice:'',
        }
    }

    componentDidMount(){


        this.setState({notice: CalendarManager.someKey})

        console.log('开始订阅通知...');
        // this.receiveNotification();

        subscription = NativeAppEventEmitter.addListener(
            'EventReminder',
            (reminder) => {
                console.log('通知信息:'+reminder.name)
                this.setState({notice:reminder.name})
            }
        );
    }

    receiveNotification(){
        //  CalendarManager.receiveNotificationName 为原生定义常量
        // CalendarManager.startReceiveNotification(CalendarManager.receiveNotificationName);
    }

    componentWillUnmount(){
        subscription.remove();
    }

    //获取Promise对象处理
    async updateEvents(){
        console.log('updateEvents');
        try{
            var events=await CalendarManager.testPromiseEvent();
            this.setState({events});
        }catch(e){
            console.error(e);
        }
    }

    render() {

        let date = new Date();

        return (
            <ScrollView>
                <View>
                    <Text style={{fontSize: 16, textAlign: 'center', margin: 10}}>
                        RN模块
                    </Text>

                    <View style={{borderWidth: 1,borderColor: '#000000'}}>
                        <Text style={{fontSize: 15, margin: 10}}>
                            普通调用原生模块方法
                        </Text>


                        <CustomButton text="调用addEvent方法-普通"
                                      backgroundColor= "#FF0000"
                                      onPress={()=>CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey')}
                        />

                        <CustomButton text="调用testDateEvent方法-日期处理"
                                      backgroundColor= "#FF7F00"
                                      onPress={()=>CalendarManager.testDateEvent('调用testDateEvent方法', '光明大街36号', date.getTime())}
                        />
                        <CustomButton text="调用addEventTwo方法-日期处理"
                                      backgroundColor= "#FFFF00"
                                      onPress={()=>CalendarManager.addEventTwo('调用addEventTwo方法', '梧桐巷36号', date.toISOString())}
                        />
                        <CustomButton text={'调用addEventThree方法-字典'}
                                      backgroundColor={'#458fff'}
                                      onPress={() => CalendarManager.addEventThree('Birthday Party',
                                          {
                                              location: '4 Privet Drive, Surrey',
                                              time: date.getTime(),
                                              description: '...'})
                                      }/>

                        <CustomButton text={'调用testCallbackEvent方法 -- 回调'}
                                      backgroundColor={'#e5e345'}
                                      onPress={() => CalendarManager.testCallbackEvent((error, events) => {
                            if (error) {
                                console.error(error);
                            } else {
                                this.setState({events: events});
                            }
                        })}/>

                        <CustomButton text={'测试线程'}
                                      backgroundColor={'#987654'}
                                      onPress={() => CalendarManager.doSomethingExpensive('参数1', ((error, events) => {
                                          if (error) {
                                              console.error(error);
                                          } else {
                                              this.setState({events: events});
                                          }
                                      }))}/>
                        <Text style={{fontSize: 15, margin: 10}}>
                            'Callback返回数据：{this.state.events}
                        </Text>

                        <Text style={{fontSize: 15, margin: 10}}>{'NativeAppEventEmitter: ' + this.state.notice}</Text>
                    </View>

                </View>
            </ScrollView>
        );
    }
}



AppRegistry.registerComponent('SwiftRnApp', () => ModulesDemo)

