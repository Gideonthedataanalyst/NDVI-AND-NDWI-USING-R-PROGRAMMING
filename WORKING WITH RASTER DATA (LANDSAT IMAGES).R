# for NDVI

#Install Required Packages

install.packages("terra")
install.packages("raster")

#Load Required Libraries
library(terra)  
library(raster)


#load landsat  images
setwd("C:/Users/Admin/Desktop/NDVI")

# Load the Red and NIR bands
red_band <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B4.tif")
nir_band <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B5.tif")
#Using raster 

ndvi <- (nir_band - red_band) / (nir_band + red_band)
#Using terra

ndvi <- (nir_band - red_band) / (nir_band + red_band)

plot(ndvi, main = "NDVI from Landsat 9")

#Export NDVI as a GeoTIFF 

writeRaster(ndvi, "ndvi_landsat9.tif", format = "GTiff", overwrite = TRUE)



#for NDWI
green_band <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B3.tif")
nir_band <- raster("LC09_L1TP_168061_20240614_20240614_02_T1_B5.tif")


ndwi <- (green_band - nir_band) / (green_band + nir_band)

plot(ndwi, main = "NDWI from Landsat 9")

#Display both ndvi and ndwi

# Set up a 1x2 plotting area (1 row, 2 columns)
par(mfrow = c(1, 2))


# Plot NDWI
plot(ndwi, main = "NDWI from Landsat 9")

# Plot NDVI
plot(ndwi, main = "NDVI from Landsat 9")

# Reset the plotting area to default (if needed)
par(mfrow = c(1, 1))



