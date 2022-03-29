// 引擎是QV4，只支持 es5

// 类的构造函数
function OperatorNum(num){
    this.number=num
    this.add=function(p){
        return num+p
    }
    this.sub=function(p){
        return num-p
    }
}
// 随机数
function getRangeRandom(min, max) {
    let minNum = min?Math.ceil(min):0;
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - minNum + 1)) + minNum; //含最大值，含最小值 
}
function getColorRandom() { 
    let red =getRangeRandom(0,255)
    let green =getRangeRandom(0,255)
    let blue = getRangeRandom(0, 255)
    return {red:red/255,green:green/255,blue:blue/255}
}
// 颜色随机生成器
function getColorBuilder(rgbFunction) {
    return function () {
        let color = getColorRandom()
        return rgbFunction(color.red,color.green,color.blue)
    }
}
