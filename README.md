# LAB6

## Objetivos

Cómo generar PDFs, cargar archivos y manejar puntos geográficos.

## Pasos previos

Ver la sección [preparar repositorio](https://github.com/I110IS/lab1/blob/master/README.md#preparar-repositorio)

## Parte 1 - PDFs y archivos

1. Permitirle a un monstruo exportar uno de sus tweets.
    1. Debe agregarse un botón en la vista de `tweets#show` que lleve al monstruo a exportar su tweet a PDF.
1. Permitirle a un monstruo cargar una foto para su perfil.
    1. Copiar la funcionalidad de crear/editar monstruos del laboratorio de formularios.
    1. Actualizar el crear/editar monstruo para permitir cargar una foto.
1. Mostrar la foto cargada en el paso anterior al lado izquierdo de cada tweet, en lugar del doodle.
    1. Si el monstruo no tiene foto cargada, continuar mostrando el doodle que se muestra actualmente.

## Parte 2 - Puntos geográficos

1. Agregar una columna de tipo `point` para guardar la latitud y longitud de dónde se creó un tweet.
1. Actualizar el formulario de tweets para enviar la latitud y longitud del monstruo al crear el tweet.
1. Actualizar el controlador para recibir la latitud y longitud y guardarlo en el tweet.
1. Actualizar `tweets#show` para mostrar en un mapa la ubicación desde donde fue enviado el tweet.
    1. No mostrar mapa si el tweet no tiene información geográfica.
1. Guardar la ubicación actual del usuario en la sesión.
1. Actualizar el `tweets#index` para que en el listado de tweets se muestren primero los tweets más cercanos al usuario.
1. Actualizar el `tweets#index` para mostrar únicamente los tweets dentro del casco urbano platense cuando se reciba el parametro `lp=true`.
1. Actualizar el `tweets#show` para mostrar la dirección desde donde fue creado el tweet.
    1. Se puede usar https://www.geoapify.com/reverse-geocoding-api (Ver laboratorio sobre APIs externas)
