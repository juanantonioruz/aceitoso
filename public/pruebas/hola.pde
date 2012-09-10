boolean iniciado=false;
float mouseXClick;
float mouseYClick;
float alturaCuadro=20;
float anchuraCuadro=20;
int[] colores;
void setup(){
//println("loading works");
size(500, 500);
float limite=(int)height/alturaCuadro*(int)width/anchuraCuadro;
colores = new int[limite];
for(int i=0; i < limite; i++) {
  colores[i] = color(random(255), random(255), random(255));
}

}
void draw(){
background(155);
for(int i=1; i<((int)height/alturaCuadro)-1; i++){
	for(int j=1; j<((int)width/anchuraCuadro)-1; j++){
		float laY=i*alturaCuadro;
		float laX=j*anchuraCuadro;
		fill(colores[i*j]);
		rect(laX, laY, anchuraCuadro, alturaCuadro);
	}
}


if(iniciado){
	pushStyle();
	rectMode(CENTER);
	
	fill(255,0,0);
	rect(mouseXClick, mouseYClick, anchuraCuadro, alturaCuadro);
	popStyle();
}	
}

void mouseClicked() {
iniciado=true;
mouseXClick=mouseX;
mouseYClick=mouseY;
//println("mouseClicked posicion: "+mouseX+" /-/ "+mouseY);

}