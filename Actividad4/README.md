# so1_actividades_201908338

#ACTIVIDAD 4

##CREACION DEL SCRIPT PARA EL SERVICIO DE SALUDO
saludo_script.sh:
#!/bin/bash
echo "Hola, este es un saludo desde el script."
echo "La fecha actual es: $(date)"


##CREACION DEL SERVICIO DE SALUDO
saludo.service:
[Unit]
Description=Script de saludo y fecha

[Service]
Type=simple
ExecStart=home/mcrv208/Escritorio/USAC/so1_actividades_201908338/Actividad4/saludo_script.sh

[Install]
WantedBy=multi-user.target

## DESPLIEGUE SERVICIO
<span>![</span><span>No cargo imagen de respuesta</span><span>]</span><span>(</span><span>/cap.png</span><span>)</span>

