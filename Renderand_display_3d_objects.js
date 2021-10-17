Qt.include("three.js")

var camera, scene, renderer,light;
var cube,line;
var leftLight;
var rightLight;
var material;
var flagt =false;
var count = 0;
var obj_loader;
var sphere;
var axes = new THREE.AxesHelper(20);
const that = this

function initializeGL(canvas)
{


    // define a scence
    scene = new THREE.Scene();


    // Set Camera and define its date
    camera = new THREE.PerspectiveCamera(45, canvas.width / canvas.height, 0.1, 1000);


    // Creat a Renderer
    renderer = new THREE.Canvas3DRenderer(
                { canvas: canvas, antialias: true, devicePixelRatio: canvas.devicePixelRatio ,alpha:true});
    renderer.setSize(canvas.width, canvas.height);
    renderer.setClearColor('#696969',1.0);
    renderer.shadowMap.enabled = true;


    // renderer.setClearAlpha(0.0);


    // Creat a  model

        var loader = new THREE.ObjectLoader();
                       loader.load('1000041.json',function(obj){
                           obj.position.x = 0;
                           obj.position.y = 0;
                           obj.position.z = 0;
                           obj.scale.x = obj.scale.y = obj.scale.z =10;
                           obj_loader = obj;
                          scene.add(obj_loader);
                       });






    scene.add(axes);


    //将相机位置和视点放在场景中间
    camera.position.x = 0;
    camera.position.y = 100;
    camera.position.z = 100;
    camera.lookAt(scene.position);

    var spotLight = new THREE.SpotLight(0xffffff);
    spotLight.position.set(-80,120, -20);
    scene.add(spotLight);

}




function resizeGL(canvas)
{

    camera.aspect = canvas.width / canvas.height;
    camera.updateProjectionMatrix();

    renderer.setPixelRatio(canvas.devicePixelRatio);
    renderer.setSize(canvas.width, canvas.height);

}


function paintGL(canvas)
{
    renderer.render(scene, camera);
}

function rotate(x,y,z){
    obj_loader.rotation.x += x;
    obj_loader.rotation.y += y;
    obj_loader.rotation.z += z;
}


function makeitbig(){
   obj_loader.scale.x *= 1.1;
   obj_loader.scale.y *= 1.1;
   obj_loader.scale.z *= 1.1;

}

function makeitsmall(){
   obj_loader.scale.x *=0.9;
   obj_loader.scale.y *=0.9;
   obj_loader.scale.z *=0.9;
}
