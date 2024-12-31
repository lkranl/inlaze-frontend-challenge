# Proceso para el uso del Pipeline

El pipeline se ejecuta cada vez que se realiza un commit con un tag. A continuación, se presenta el paso a paso para ejecutarlo.

1. **Agregar los cambios y generar el commit que se va a versionar**
   ```console
   foo@bar:~$ git add .
   foo@bar:~$ git commit -m "commit message"
   ```

2. **Crear el tag adecuado a la versión**  
   El tag sigue el formato `v*.*`
   ```console
   foo@bar:~$ git tag -a v1.1 -m "tag message"
   ```

3. **Hacer el push del tag**
   ```console
   foo@bar:~$ git push origin tag v1.1
   ```

4. **Hacer push al commit**
   ```console
   foo@bar:~$ git push origin main
   ```

5. **Aprobar la ejecución del Github Action** en la pestaña [Actions](https://github.com/lkranl/inlaze-frontend-challenge/actions)

<sub>_*Por razones de esta prueba, las restricciones de aceptación del Action establecen que únicamente el dueño del repositorio tiene la capacidad de aprobar la ejecución._</sub>
