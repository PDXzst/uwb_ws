# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/noetic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/noetic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/home/robot/ros_ws/biyesheji_ws/devel;/home/robot/scout_ws/devel_isolated/velodyne_simulator;/home/robot/scout_ws/devel_isolated/velodyne_gazebo_plugins;/home/robot/scout_ws/devel_isolated/velodyne_description;/home/robot/scout_ws/devel_isolated/scout_gazebo_sim;/home/robot/scout_ws/devel_isolated/scout_description;/home/robot/scout_ws/devel_isolated/scout_control;/home/robot/scout_ws/devel_isolated/offboard_pkg;/home/robot/scout_ws/devel;/home/robot/ros_ws/catkin_ws/devel;/opt/ros/noetic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python3/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/robot/uwb_ws/devel/env.sh')

output_filename = '/home/robot/uwb_ws/build/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
