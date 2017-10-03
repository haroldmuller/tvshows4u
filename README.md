<h2> README </h2>

La aplicación TvShows4u posee las siguientes funcionalidades:

- Login via facebook
- Obtención de datos vía imdb (Rating y certificación)
- Búsqueda. Si no se selecciona un filtro (director, genero), la búsqueda se realizará en sobre el título y descripción de las series. Si se elige algún filtro, se obtendrán resultados dependiendo si lo ingresado corresponde a algún director o género.
- Mailer: El usuario puede enviar mails para recomendar alguna serie, o la misma página. Si no hay un usuario logueado, se puede recomendar el sitio.
- Sección de favoritos del usuario.
- Sección de admin.
  - El admin tiene acceso a gráficos que muestran diferentes kpi. <h> Nota: </h> Si los gráficos no se muestran, i.e aparece que hubo algún error, <h> refrescar la página </h>.




<h> Para poder correr la aplicación se deben seguir los siguientes pasos: </h>

1. Verificar que todas las gemas usadas esten instaladas. Para esto, ejecutar en consola:
<pre lang="no-highlight">
<code>
$ bundle install
</code>
</pre>

NOTA: Se debe verificar que todas las gemas se installen correctamente. Para la gema Paperclip se debe instalar nmagick Version 6.X, cualquier otra versión no funcionará.

3. Poblar la BD. Ejecutar el consola:
<pre lang="no-highlight">
<code>
$ rails db:seed
</code>
</pre>


4. Hacer las migraciones correspondientes. Para esto, correr:
<pre lang="no-highlight">
<code>
$ rails db:migrate
</code>
</pre>


5. Iniciar el servidor. Para esto, se debe ejecutar la siguiente línea de comando:

<pre lang="no-highlight">
<code>
$ rails s
</code>
</pre>

6. Ir a la página <h> https://localhost:3000 </h>
