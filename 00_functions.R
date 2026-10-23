## 00_functions.R ##
# Purpose: store the function we use in the cleaning script.
# Why a separate file: we write the function once and can reuse it,
# and the cleaning script stays short and easy to read.

# This function converts a body length from pixels to meters
# It is needed as the drone takes photos from different heights.
# One pixel covers more ground from higher up, so the same whale
# looks smaller on the photo. The altitude and the camera settings
# enable to correct this.
#
# Step 1: size of one pixel on the camera sensor (mm)
#         = sensor width / image width
# Step 2: meters covered by one pixel
#         = pixel size * altitude / focal length
pixels_to_metres <- function(length_pixels,
                             altitude_m,
                             sensor_width_mm,
                             image_width_px,
                             focal_length_mm) {
  pixel_size_mm <- sensor_width_mm / image_width_px
  length_m <- length_pixels * pixel_size_mm * altitude_m / focal_length_mm
  return(length_m)
}