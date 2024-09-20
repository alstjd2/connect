const dcmNumCnfNo =  document.querySelector("#dcmNumCnfNo");
const dateCnfNo =  document.querySelector("#dateCnfNo");
const dcmCodeNo =  document.querySelector("#dcmCodeNo");
const dcmNumLen =  document.querySelector("#dcmNumLen");
const dcmDisCnfNo =  document.querySelector("#dcmDisCnfNo");

const cnfNo =  document.querySelector("#cnfNo");
const dcmCode =  document.querySelector("#dcmCode");
const dcmNum =  document.querySelector("#dcmNum");
const between1 =  document.querySelector("#between1");
const between2 =  document.querySelector("#between2");

dcmNumCnfNo.addEventListener('change',function(){
	if(dcmNumCnfNo.value == "DB02110"){
		dateCnfNo.classList.add("d-flex");
		dateCnfNo.classList.remove("d-none");
		dcmCodeNo.classList.add("d-flex");
		dcmCodeNo.classList.remove("d-none");
		
		cnfNo.classList.add("d-inline");
		cnfNo.classList.remove("d-none");
		dcmNum.classList.add("d-inline");
		dcmNum.classList.remove("d-none");
		
		between1.classList.add("d-inline");
		between1.classList.remove("d-none");		
		between2.classList.add("d-inline");
		between2.classList.remove("d-none");
	}else if(dcmNumCnfNo.value == "DB02120"){
		dateCnfNo.classList.add("d-none");
		dateCnfNo.classList.remove("d-flex");
		dcmCodeNo.classList.add("d-flex");
		dcmCodeNo.classList.remove("d-none");
		
		cnfNo.classList.add("d-none");
		cnfNo.classList.remove("d-inline");
		dcmNum.classList.add("d-inline");
		dcmNum.classList.remove("d-none");
		
		between1.classList.add("d-none");
		between1.classList.remove("d-inline");		
		between2.classList.add("d-inline");
		between2.classList.remove("d-none");
	}else if(dcmNumCnfNo.value == "DB02130"){
		dateCnfNo.classList.add("d-none");
		dateCnfNo.classList.remove("d-flex");
		dcmCodeNo.classList.add("d-none");
		dcmCodeNo.classList.remove("d-flex");
		
		cnfNo.classList.add("d-none");
		cnfNo.classList.remove("d-inline");
		dcmNum.classList.add("d-none");
		dcmNum.classList.remove("d-inline");
		
		between1.classList.add("d-none");
		between1.classList.remove("d-inline");		
		between2.classList.add("d-none");
		between2.classList.remove("d-inline");
	}else if(dcmNumCnfNo.value == "DB02140"){
		dateCnfNo.classList.add("d-flex");
		dateCnfNo.classList.remove("d-none");
		dcmCodeNo.classList.add("d-none");
		dcmCodeNo.classList.remove("d-flex");
		
		cnfNo.classList.add("d-inline");
		cnfNo.classList.remove("d-none");
		dcmNum.classList.add("d-none");
		dcmNum.classList.remove("d-inline");	
		
		between1.classList.add("d-inline");
		between1.classList.remove("d-none");		
		between2.classList.add("d-none");
		between2.classList.remove("d-inline");	
	}
});