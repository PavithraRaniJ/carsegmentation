import numpy as np
import cv2

arr = np.load("C:\\segmentation\\tracking\\output\\predict2\\seg_points\\1.npy")


nb_car = arr.shape[0]

for i in range(nb_car):
    cv2.imshow('test', arr[i])
    cv2.waitKey(0)