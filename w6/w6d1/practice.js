document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;
  let ctx = canvas.getContext('2d');

  ctx.fillStyle = 'red';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 250, 0, Math.PI * 2);
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();
});
