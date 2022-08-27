const alicia = [10, 80, 75];
const bob = [90, 20, 25];

function encontrarGanador(a, b) {
    let puntosa = 0;
    let puntosb = 0;
    let etapax = 1;
    let ganadoretapa;

    for (let i = 0; i < a.length; i++) {
        if (a[i]>b[i]) {
            puntosa++;
            ganadoretapa = "Alicia";
        }
        else if(a[i]<b[i]){
            puntosb++;
            ganadoretapa = "Bob";
        }
        else{
            console.log("Ninguna persona recibe puntos");
        }
        let Concurso = {
            etapa: etapax,
            ganador: ganadoretapa
        }
        etapax ++;
        console.log("El ganador de la etapa " + Concurso.etapa + " es " + Concurso.ganador);
    }
    /*
    if (puntosa>puntosb) {
        console.log("El concurso lo ganó Alicia");
    }
    else if(puntosa<puntosb){
        console.log("El concurso lo ganó Bob");
    }
    else{
        console.log("Es un empate");
    }
    */
}
encontrarGanador(alicia,bob)
