/**
 * @author juanitu
 */
var map, controls,layer_museos,layer_hitos, indexLayerMuseos, mercator, geographic,p,selectControl, selectControl,capas_sensibles, panel_ampliable, es_ampliado;
  var centroLonLatPeninsula=new OpenLayers.LonLat('-666497.4453543', '4493995.6445449');
  var zoomCentroPeninsula=4;
var	zoomMapa=8;


function inicia_capas_base(map){
		var layer = new OpenLayers.Layer.OSM( "Open Street Map");
			var ghyb = new OpenLayers.Layer.Google(
			    "Google Hybrid",
			    {type: google.maps.MapTypeId.HYBRID, numZoomLevels: 20}
			    // used to be {type: G_HYBRID_MAP, numZoomLevels: 20}
			);            
			var gmap = new OpenLayers.Layer.Google(
			    "Google Streets", // the default
			    {numZoomLevels: 20}
			    // default type, no change needed here
			);			
			map.addLayer(layer);
			map.addLayer(ghyb);
			map.addLayer(gmap);
}

function add_events_to_ruta(ruta){
	  ruta.events.on({
                "featureselected": onFeatureSelectSun,
                "featureunselected": onFeatureUnselectSun
            });
}


	function onFeatureSelectSun(event){
		var feature = event.feature;
		// Since KML is user-generated, do naive protection against
		// Javascript.
		var content = "<h2>" + feature.attributes.name + "</h2>" + feature.attributes.description;
		if (content.search("<script") != -1) {
			content = "Content contained Javascript! Escaped content below.<br>" + content.replace(/</g, "&lt;");
		}
		$("#explanation").append(content);
		popup = new OpenLayers.Popup.FramedCloud("chicken", feature.geometry.getBounds().getCenterLonLat(), new OpenLayers.Size(100, 100), content, null, true, onPopupCloseSun());
		popup.maxSize = new OpenLayers.Size(300, 300);
		feature.popup = popup;
		map.addPopup(popup);
		disableaLinks();

		
	}
        function onFeatureUnselectSun(event) {
            var feature = event.feature;
            if(feature.popup) {
                map.removePopup(feature.popup);
                feature.popup.destroy();
                delete feature.popup;
            }
        }
		
		   function onPopupCloseSun() {
		   	// antes recibia un parametro que era   selectSun
			//	selectorito.unselectAll();
            }
			
			
	function load_KML(nombre_capa, url_kml){
		 return new OpenLayers.Layer.Vector(nombre_capa, {
                projection: geographic,
                strategies: [new OpenLayers.Strategy.Fixed()],
                protocol: new OpenLayers.Protocol.HTTP({
                    url: url_kml,
                    format: new OpenLayers.Format.KML({
                        extractStyles: true,
                        extractAttributes: true
                    })
                })
            });
	}
	
	var actuales=[];
	//llamade desde processing resource.pjs parece que no accede a la variable map
	var kmls=[];
	function addLayerKML(nombre, url_kml){
				 var idx = actuales.indexOf(nombre); // Find the index
				 if(idx!=-1){
				 	// se encuentra
					// visibleIds.splice(idx, 1); // Remove it if really found!
				 //	console.info("si se encuentra"+nombre);
				 	
				 } else{
				 						//  map.removeControl(selectControl);
				 	//console.info("no se encuentra"+nombre);
					
				 		vector=load_KML(nombre, url_kml);
						kmls.push([nombre, url_kml]);
						add_events_to_ruta(vector);
						add_capa_seleccionable(map, vector);
						//selectControl.map.layers.push(vector);
						actuales.push(nombre);
						//console.log(actuales);
				 }
		
	}
	
function borrando(event){
	//alert("borrando"+event.layer);
}
	
function deleteAllLayersSensibles(centro, zoomito){
	kmls=[];
	capas_sensibles=[]
	actuales=[];
	layer_museos=null;
	layer_hitos=null;
	map.center=centro;
	map.zoom=zoomito;
	if(es_ampliado){
		
		ampliaMapa();
		
	}else{
		
	 reduceMapa();
	}
		//cambiaDimension("200px","200px",centro, zoomito );
		//es_ampliado=false;
		

}

	
	var hitos_peticion;
		function loadMarcas(peticion){
				hitos_peticion=peticion;

				 layer_hitos = new OpenLayers.Layer.Vector("HITOS", {
					projection: geographic,

                    strategies: [new OpenLayers.Strategy.BBOX({resFactor: 1.1})],
                    protocol: new OpenLayers.Protocol.HTTP({
                        url: "/resources/"+peticion,
                        format: new OpenLayers.Format.Text()
                    })
                });

			

					
				 layer_hitos.events.on({
                    'featureselected': onFeatureSelect,
                    'featureunselected': onFeatureUnselect
                });
				
				add_capa_seleccionable(map, layer_hitos);


				
			}

	function activar_selectControl(){
				map.removeControl(selectControl);
				//console.dir(capas_sensibles);
				 selectControl = new OpenLayers.Control.SelectFeature(
                capas_sensibles,
                {
                    clickout: true, toggle: false,
                    multiple: false, hover: false,
                    toggleKey: "ctrlKey", // ctrl key removes from selection
                    multipleKey: "shiftKey" // shift key adds to selection
                }
            );
            
            map.addControl(selectControl);
            selectControl.activate();
			}
		
	
	function add_capa_seleccionable(mapa, vector){
		//if (mapa.getLayersByName(vector.name).length>0) return ; 
		 mapa.addLayer(vector);
//		if(layer_hitos!=null)mapa.raiseLayer(layer_hitos, mapa.getNumLayers()-2);
		if(layer_museos!=null)mapa.raiseLayer(layer_museos, mapa.getNumLayers()-1);
		// console.log("despues"+mapa.getLayerIndex(layer_museos));
		capas_sensibles.push(vector);
			
	}
	function cambiaDimension(altura, anchura, center,zoom){
		$("#container_mapa").empty();
		$('#container_mapa').append('<div id="mapa_div" ></div>');

		$("#OpenLayers_Map_13_OpenLayers_ViewPort").animate({
    width: anchura, height:altura
  }, 1500 );
$("#container_mapa").animate({
    width: anchura, height:altura
  }, 1500 );
$("#mapa_div").animate({
    anchura: anchura, height:altura
  }, 1500, function(){
  	init_mapa(center,zoom);
  } );
$("#footer").animate({
    width: anchura, height:altura
  }, 1500 );

	}
	
	
	function ampliaMapa(evt){
				

		es_ampliado=true;
		var altura=$(document).height()-100;
		var anchura=$(document).width()-$('aside').width()-100;
		if(centroLonLatPeninsula==map.center)
		z=map.zoom;
		else
		z=8;
		cambiaDimension(altura +"px",anchura +"px", map.center,map.zoom);
		
	}

	function reduceMapa(evt){
	
		es_ampliado=false;
		cambiaDimension("200px","200px",map.center,map.zoom);
	}
	

			
			function creaPanelAmpliable(es_ampliado){
				botonDefault=null;
				if(es_ampliado){
				    botonDefault = new OpenLayers.Control.Button({
						displayClass: "reduce",
	        title: "Reducir Dimension de mapa",
	        text: "REDUCIR MAPA",trigger:reduceMapa}
	    );
					
				}else{
					
				 botonDefault = new OpenLayers.Control.Button({
			displayClass: "amplia",
	        title: "Ampliar Dimension de Mapa",
	        text: "AMPLIAR MAPA",trigger: ampliaMapa}
	    );
				}
	
	 var panel = new OpenLayers.Control.Panel({
	 				        defaultControl: botonDefault,

			        createControlMarkup: function(control) {
		            var button = document.createElement('button'),
		                iconSpan = document.createElement('span'),
		                textSpan = document.createElement('span');
		            iconSpan.innerHTML = '&nbsp;';
		            button.appendChild(iconSpan);
		            if (control.text && false) {
		                textSpan.innerHTML = control.text;
		            }
		            button.appendChild(textSpan);
		            return button;
		        }
				
   				 });
				 	  	  panel.addControls([botonDefault]);

			return panel;
			}
		
			
			  // Needed only for interaction, not for the display.
            function onPopupClose(evt) {
                // 'this' is the popup.
                var feature = this.feature;
                if (feature!=undefined && feature.layer_museos) { // The feature is not destroyed
                    selectControl.unselect(feature);
                } else { // After "moveend" or "refresh" events on POIs layer all 
                         //     features have been destroyed by the Strategy.BBOX
						             
                    this.destroy();
                }

            }
         
            function onFeatureSelect(evt) {
                feature = evt.feature;
                popup = new OpenLayers.Popup.FramedCloud("featurePopup",
                                         feature.geometry.getBounds().getCenterLonLat(),
                                         new OpenLayers.Size(100,100),
                                         "<h2><a href='#' onclick='circles("+feature.attributes.id+")'>(ir a)</a>"+feature.attributes.title + "</h2>" +
                                         feature.attributes.description,
                                         null, true, onPopupClose);
//				 popup.autoSize=false;
				 			popup.maxSize= new OpenLayers.Size(300, 300);

                feature.popup = popup;
                popup.feature = feature;
                map.addPopup(popup, true);
				disableaLinks();
            }
			function disableaLinks(){
				/*
				$("a").each(function(){
			if ((!this.href.match(document.domain))) {
			
				console.log(this.href);
				this.href = "#";
				
			}
		});
		*/
			}
			function circles(id){
				 p.setR(id);
		         p.setup();
			}
            function onFeatureUnselect(evt) {
                feature = evt.feature;
                if (feature.popup) {
                    popup.feature = null;
                    map.removePopup(feature.popup);
                   // esto lo he comentado yo, revisar a ver si va a dar fallos feature.popup.destroy();
                    feature.popup = null;
                }
            }
			function load_layer_museos( url_museos_int){
				url_museos=url_museos_int;
					 layer_museos = new OpenLayers.Layer.Vector("MUSEOS", {
					projection: geographic,

                    strategies: [new OpenLayers.Strategy.BBOX({resFactor: 1.1})],
                    protocol: new OpenLayers.Protocol.HTTP({
                        url: url_museos_int,
                        format: new OpenLayers.Format.Text()
                    })
                });

			add_capa_seleccionable(map, layer_museos);
	
	
			layer_museos.events.on({
                'featureselected': onFeatureSelect,
                'featureunselected': onFeatureUnselect
            });
	
			indexLayerMuseos=map.getNumLayers()-1;
			}
			
function coloca(lon, lat) {
	var lonlat = new OpenLayers.LonLat(lon, lat).transform(geographic, mercator);
	//map.panTo(lonlat);
	return lonlat;
	
}
			
function centerMapaPeninsula(){
	            map.setCenter( centroLonLatPeninsula, zoomCentroPeninsula);

}
			var url_museos="/resources/museostextfile";
 function init_mapa(center, zoom){
		actuales=[];
	 	capas_sensibles=[];
	    mercator = new OpenLayers.Projection("EPSG:900913");
	    geographic = new OpenLayers.Projection("EPSG:4326");
        map = new OpenLayers.Map('mapa_div', { 
		projection: mercator,
		controls: [
            new OpenLayers.Control.Navigation(),
            new OpenLayers.Control.PanPanel(),
            new OpenLayers.Control.ZoomPanel(),
			new OpenLayers.Control.LayerSwitcher()
        ]
		});
			
		map.events.on({
		    "removelayer": borrando
		});


		panel_ampliable= creaPanelAmpliable(es_ampliado);
		map.addControl(panel_ampliable);
				
			inicia_capas_base(map);
			if(url_museos!=null)
			load_layer_museos( url_museos);
		
		
    		
              
            map.setCenter( center, zoom);
			if(kmls!=null){
				for(var i=0; i<kmls.length; i++) {
					var value = kmls[i];
					addLayerKML(value[0],value[1]);
				}

			}
			 if(hitos_peticion!=null ) loadMarcas(hitos_peticion);
			activar_selectControl();
			if(!es_ampliado)
					$("#OpenLayers_Control_MaximizeDiv").hide();
				else
					$("#OpenLayers_Control_MaximizeDiv").show();

			return map;
            }