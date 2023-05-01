import os
import cv2
import imageio
import imutils

if __name__ == '__main__':
    step_size = 0.01 # secs
    video_fp = 'level_difficulty2.mov'
    gif_fp_dst = "level_difficulty.gif"
    
    gifimgs = []
    cap = cv2.VideoCapture(video_fp)
    fps = cap.get(cv2.CAP_PROP_FPS)
    step_size_frame = fps * step_size

    while(True):
        # get frame
        ret, frame = cap.read()
        if frame is None:
            break
        # frame = imutils.resize(frame, width=640)
        # frame = cv2.rotate(frame, cv2.ROTATE_90_CLOCKWISE)
       
        gifimgs.append(frame[:, :, ::-1])

        # set next frame
        frame_id = cap.get(cv2.CAP_PROP_POS_FRAMES)
        cap.set(cv2.CAP_PROP_POS_FRAMES, frame_id+step_size_frame)
        print(frame_id)

    imageio.mimsave(gif_fp_dst, gifimgs, fps=7)
    cap.release()
    cv2.destroyAllWindows()