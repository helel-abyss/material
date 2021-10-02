Qt.include("qrc:/three.js")

var camera, scene, renderer,light;
var cube,line;
var leftLight;
var rightLight;
var material;
var flagt =false;
var count = 0;

function initializeGL(canvas)
{

    // 设置场景
    scene = new THREE.Scene();

    // 设置相机相关参数
    camera = new THREE.PerspectiveCamera(45, canvas.width / canvas.height, 0.1, 1000);


    // 在屏幕中显示坐标
    var axes = new THREE.AxisHelper(100);
    scene.add(axes);


    //创建一个水平面
    var planeGeometry = new THREE.PlaneGeometry(60, 60);
    var planeMaterial = new THREE.MeshBasicMaterial({color: 0xcccccc});
    var plane = new THREE.Mesh(planeGeometry, planeMaterial);



    //水平面旋转并且设置位置
    plane.rotation.x = -0.5 * Math.PI;
    plane.position.x = 15;
    plane.position.y = 0;
    plane.position.z = 0;


    //将水平面添加到场景中
    scene.add(plane);


    //创建一个方块
    var cubeGeometry = new THREE.BoxGeometry(4, 4, 4);
    var cubeMaterial = new THREE.MeshBasicMaterial({color: 0xff0000, wireframe: true});
    var cube = new THREE.Mesh(cubeGeometry, cubeMaterial);


    //设置方块位置
    cube.position.x = -4;
    cube.position.y = 3;
    cube.position.z = 0;


    //将方块添加到场景中
    scene.add(cube);


    //创建一个球体
     var sphereGeometry = new THREE.SphereGeometry(4, 20, 20);
     var sphereMaterial = new THREE.MeshBasicMaterial({color: 0x7777ff, wireframe: true});
     var sphere = new THREE.Mesh(sphereGeometry, sphereMaterial);

     //设置球体位置
     sphere.position.x = 20;
     sphere.position.y = 4;
     sphere.position.z = 2;

     //将球体添加到场景中
     scene.add(sphere);

    //将相机位置和视点放在场景中间
    camera.position.x = -30;
    camera.position.y = 40;
    camera.position.z = 30;
    camera.lookAt(scene.position);


    // 创建一个渲染器
    renderer = new THREE.Canvas3DRenderer(
                { canvas: canvas, antialias: true, devicePixelRatio: canvas.devicePixelRatio ,alpha:true});
    renderer.setSize(canvas.width, canvas.height);
    renderer.setClearColor(0xEEEEEE,1.0);		// 设置画布的背景颜色

    // 设置画布背景色是透明的  需要在 初始化 renderer 的时候附带上  alpha:true
    // renderer.setClearAlpha(0.0);

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

