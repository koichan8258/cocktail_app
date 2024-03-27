document.addEventListener('DOMContentLoaded', function() {
  const addButton = document.querySelector('.add-material-button');
  const materialsDiv = document.querySelector('.materials');
  
  addButton.addEventListener('click', function(e) {
    e.preventDefault();
  
    const newMaterialDiv = document.createElement('div');
    const materialIndex = materialsDiv.querySelectorAll('.materials').length;
    newMaterialDiv.innerHTML = `
      <label for="recipe_material_name_${materialIndex}">Name</label>
      <input type="text" id="recipe_material_name_${materialIndex}" name="recipe[materials_attributes][][material_name]">
  
      <label for="recipe_quantity_${materialIndex}">Quantity</label>
      <input type="text" id="recipe_quantity_${materialIndex}" name="recipe[materials_attributes][][quantity]">
    `;
  
    materialsDiv.appendChild(newMaterialDiv);
    
    // コンソールログに生成された名前を出力
    console.log(`Generated name for material: recipe[materials_attributes][${materialIndex}][material_name]`);
    console.log(`Generated name for quantity: recipe[materials_attributes][${materialIndex}][quantity]`);
  });
});