@echo off
REM Save the current directory
SET "original_dir=%CD%"

IF "%3"=="" (
    echo Usage: %0 [model_name] [dataset_name] [epochs]
    exit /b 1
)

python YOLOv8_Segmentation_DeepSORT_Object_Tracking/ultralytics/yolo/v8/segment/train.py model=%1 data=%original_dir%\input\dataset\%2\data.yaml epochs=%3 project=%original_dir%\output