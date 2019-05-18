from PIL import Image

img = Image.open('1.png').convert('RGB')
im = img.split()
im1,im2,im3 = [i for i in im]

img2 = Image.merge('RGB',(im[2],im[1],im[0]))
im2.show()