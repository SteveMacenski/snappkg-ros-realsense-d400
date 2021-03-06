#!/bin/bash

# store locally variables from snapcraft
serial_no=`snapctl get serialno`
camera=`snapctl get cameraid`
profile=`snapctl get profile`
masterhostname=`snapctl get masterhostname`
iron=`snapctl get iron`
if [[ $masterhostname == "" ]]; then
  masterhostname='localhost'
fi
if [[ $iron != "true" ]]; then
  iron='false'
fi

# set global ones to empty again to reset
sudo snap set ros-realsense-d400 serialno="" cameraid="" profile="" masterhostname="" iron=""

if [[ $profile = 1 ]]; then
  ROS_MASTER_URI=http://${masterhostname}:11311 roslaunch --wait realsense2_camera rs_camera.launch serial_no:=$serial_no camera:=$camera depth_fps:=6 color_fps:=6 infra1_fps:=6 infra2_fps:=6 color_width:=320 color_height:=180 depth_width:=424 depth_height:=240 infra1_width:=424 infra1_height:=240 infra2_width:=424 infra2_height:=240 enable_infra1:=${iron} enable_infra2:=${iron}
elif [[ $profile = 2 ]]; then
  ROS_MASTER_URI=http://${masterhostname}:11311 roslaunch --wait realsense2_camera rs_camera.launch serial_no:=$serial_no camera:=$camera depth_fps:=6 color_fps:=6 infra1_fps:=6 infra2_fps:=6 enable_infra1:=${iron} enable_infra2:=${iron}
elif [[ $profile = 3 ]]; then
  ROS_MASTER_URI=http://${masterhostname}:11311 roslaunch --wait realsense2_camera rs_camera.launch serial_no:=$serial_no camera:=$camera depth_fps:=6 color_fps:=6 infra1_fps:=6 infra2_fps:=6 color_width:=320 color_height:=180 enable_infra1:=${iron} enable_infra2:=${iron}
elif [[ $profile = 4 ]]; then
  ROS_MASTER_URI=http://${masterhostname}:11311 roslaunch --wait realsense2_camera rs_camera.launch serial_no:=$serial_no camera:=$camera depth_fps:=6 color_fps:=6 infra1_fps:=6 infra2_fps:=6 color_width:=320 color_height:=180 depth_width:=1280 depth_height:=720 infra1_width:=1280 infra1_height:=720 infra2_width:=1280 infra2_height:=720 enable_infra1:=${iron} enable_infra2:=${iron}
elif [[ $profile = 5 ]]; then
  ROS_MASTER_URI=http://${masterhostname}:11311 roslaunch --wait realsense2_camera rs_camera.launch serial_no:=$serial_no camera:=$camera depth_fps:=6 color_fps:=6 infra1_fps:=6 infra2_fps:=6 color_width:=320 color_height:=180 depth_width:=848 depth_height:=480 infra1_width:=848 infra1_height:=480 infra2_width:=848 infra2_height:=480 enable_infra1:=${iron} enable_infra2:=${iron}
else
  ROS_MASTER_URI=http://${masterhostname}:11311 roslaunch --wait realsense2_camera rs_camera.launch serial_no:=$serial_no camera:=$camera
fi
