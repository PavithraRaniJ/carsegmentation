# Setup
1. Create a virtual env for python 3.8 (tested: 3.8.18), either using venv or conda. ALL THE FOLLOWING COMMANDS ASSUME THAT YOU ACTIVATED THIS ENV AND IS USING IT.
2. CD into the code directory with `cd YOLOv8_Segmentation_DeepSORT_Object_Tracking`
3. Install the project dependencies `pip install .[dev]`
4. Fix Pillow version with `pip install Pillow==9.5.0`
5. `pip install easydict` + `conda install -c anaconda git`

Bellow are commands to use the GPU
6.  `pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121` (check https://pytorch.org/get-started/locally/)
7. In case you get errors, remove torchvision `pip uninstall torchvision` then run the above command again


# Training
## Prepare the dataset
1. Copy and paste the dataset folder into `input/dataset`
2. Open and edit the data.yaml file. Make sure train, val and test point to the right directories with your images and labels. Make sure to use absolute paths.
3. The name of the folder containing your dataset should not contain any spaces or commas

## Train the model
Simply run the train script found in the root directory of the project: `.\train.bat [model_name] [dataset_name] [epochs]`
- model_name can be the path to a pretrained model or `yolov8n-seg.yaml` for example to train from scratch. Refer to ultralytics docs for more info on models names.
- dataset_name is the name of the directory containing your dataset created in "Prepare the dataset" steps
- You can find the output under `output/train*`

# Prediction
Simple run the predict script `.\predict.bat [video_name] "x1-y1-x2-y2" [fps] [ppm] [model]`

There is a few parameters that you need to set according to your video:
1. x1-y1-x2-y2: Defines the line that is perpendicular to the road, used for counting cars only (won't affect detection or speed calculation)
2. fps: The frame rate of your video (affects speed calculation)
3. ppm: Pixels Per Meter. This should be an estimation, you can't have an exact value since it's not the same everywhere in the image. Computed based on the road section on which you want the speed to be most accurate.
4. model: Absolute path to your pretrained model, or you can use an existing one like `yolov8n-seg.yaml`

You can check the output under `output/predict*` it will contain a video of the results as well as a CSV file tracking the position and speed of every vehicle in each frame."# carsegmentation" 
