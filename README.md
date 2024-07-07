## 本项目适用于LinkTrack uwb 进行室内三维定位

LinkTrack官网`https://www.nooploop.com/cn/download/`  
***
### 方法一：使用LinkTrack自带的定位系统（这个方法本人没有测试过）
按照用户手册`LinkTrack_User_Manual_V2.3_zh.pdf`配置`LP Mode 快速入门`章节进行配置  

<div align="center">

![](/image/截图2.png)    

</div>

***
### 方法二：使用本人写的功能包设置定位系统
本定位系统UWB配置为`DR Mode`  
<div align="center">

![](/image/安装场景.png)  

</div>

按照图片中显示的编号摆放UWB  **注**：UWB已用贴纸标号  
作为`tag`的UWB安装在小车上 推荐安装在车顶以减小信道遮挡带来的误差  

> 1.将`src/.`文件夹中的功能包拷入对应的ros工作空间`XX_ws/src/.`
> 
> 2.参考LinkTrack官网`https://www.nooploop.com/cn/download/`配置好电脑的串口驱动  
<div align="center">

![](/image/uwb驱动安装.png)  

</div>

> 3.给予串口可执行权限 `sudo chmod 777 /dev/ttyCH343USB0` 如果连接上UWB后`/dev/.`目录下没有`ttyCH343USB0`说明串口驱动还没安装好
> 
> 4.测量各个UWB基站的坐标，并将坐标填入`pozyx_simulation/src/uwb_exper/LMplus_uwb_calculate_exper.cpp`  
<div align="center">

![](/image/定位位置.png)  

</div>

> 5.编译ros工作空间  `catkin_make`  由于创建了三个新的`msgs` 可能编译时找不到对应的msgs而编译失败。解决方法：反复编译几次直到成功。
> 
> 6.启动UWB  

```
roslaunch nlink_parser linktrack.launch
```

> 7.启动定位程序  

```
roslaunch pozyx_simulation uwb_exper.launch
```

> 定位话题  

```
rostopic echo /uav_position
```

> 8.`shells`文件夹放置了我写的一键启动脚本  
在程序成功运行后，后续可直接使用我写的脚本一步启动，避免了繁复的启动程序  

```
bash uwb.sh
```

### 可能遇到的问题
- [ ] `catkin_make`时某些头文件无法找到:  
如果时msg对应的头文件，反复编译就可以解决；其他头文件请自行百度安装  
- [ ] 安装UWB串口驱动后找不到ttyCH343USB0:  
通过`bios`关闭电脑的安全启动再尝试，具体方法因为各个电脑不同，请百度  
- [ ] 程序错误  
找出错误的模块，然后咨询我修改方法  

### 各个功能包的作用
`moving_filer`用于均值滤波，去掉UWB测距信号的高频噪声  
`nlink_parser`LinkTrack系统UWB射频模块的启动程序  
`uwb_msgs`本人写的UWB消息类型`uwb_msgs/uwb`  
`nlink_t`用于将`nlink_parser`产生的UWB消息类型`nlink_parser/LinktrackNodeframe2`转化为便于后续处理的UWB消息类型`uwb_msgs/uwb`  
`pozyx_simulation`利用UWB基站坐标进行多边定位获得`UWB tag`的坐标  

### 注：由于采用eskf融合IMU与单纯使用UWB进行定位，定位结果差不多，本UWB定位系统不使用IMU进行滤波  



