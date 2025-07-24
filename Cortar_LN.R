## Codigo para cortar un raster a diferentes altitudes.

## Oportunidades de mejora:
## 1. Que el codigo lea automaticamente los nombres de los raster alojados en 
##    una carpeta.
## 2. Que el bucle for vaya cortando para cada elevacion definida y para cada raster
## 3. Que el vector de linea de nieves ingresado se ordene de menor a mayor (o viceversa).
## 4. Que los resultados se alojan en una carpeta aparte.
## 5. Ocupar ifel para cortar el raster.

## 1. Carga de librerias
library(terra)


## 2. Carga de archivo raster
raster_path <- "C:/Users/felipe.garcia/Codigos/Cortar_LN/Raster"
raster_file <- "DTM_filled.tif"
raster <- rast(file.path(raster_path, raster_file))

## 3. Verificacion visual para comprobar que raster se ha cargado correctamente
plot(raster, main = "Raster: DTM_filled")
## Si se quieren mejores colores, puedes utilizar la sigueinte linea:
## plot(raster, col = terrain.colors(25), main = "Visualización del ráster cargado")

## 4. Definicion de vector de elevación de lineas de nieves.
altitudes_LN <- c(2954, 2569, 2546, 2899, 2508, 2478, 2452, 2420, 2729, 2065, 2032)

## 5. Creación de un bucle para cortar el raster a diferentes altitudes
for (altitude in altitudes_LN) {
  output_file <- paste0("C:/Users/felipe.garcia/Codigos/Cortar_LN/Raster/DTM_filled_", altitude, ".tif")
  
  # Crear raster cortado a la altitud
  raster_cortado <- raster
  raster_cortado[raster < altitude] <- NA
  
  # Guardar el raster cortado
  writeRaster(raster_cortado, filename = output_file, overwrite = TRUE)
  
  cat("Raster cortado a", altitude, "guardado en", output_file, "\n")
}
