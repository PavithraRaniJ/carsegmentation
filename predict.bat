@echo off
REM Save the current directory
SET "original_dir=%CD%"

cd YOLOv8_Segmentation_DeepSORT_Object_Tracking/ultralytics/yolo/v8/segment/

REM Check if enough arguments are passed
IF "%5"=="" (
    echo Usage: %0 [video_name] "x1-y1-x2-y2" [fps] [ppm] [model]
    exit /b 1
)

REM Prepend the relative path to the video name
SET source=../../../../../input/video/%1

REM Use the arguments with the dynamic project path
python predict.py model=%5 source=%source% line=%2 fps=%3 ppm=%4 project=%original_dir%\output task="segment" mode="predict"
