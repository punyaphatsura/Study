function initTable() {
  nm = [
    "ปุญญพัฒน์ สุรเกียรติกำจร",
    "ศุภฤกษ์ คงประพันธ์",
    "วชิรวิชญ์ กานิล",
    "ภูภิพัทธ์ สิงขร",
    "asdsad",
  ];
  var html =
    '<td><input id = "item-to-add" type="text"></td><td><select id="name-to-add"><option> -- เลือกผู้ฝากซื้อ -- </option>';

  for (let i = 0; i < nm.length; i++) {
    html = html + "<option>" + nm[i] + "</option>";
  }
  html =
    html +
    '</select></td><td><input type="number" id="price-to-add"></td><td><input id="add-newrow" type="button" value="เพิ่ม" onclick="addRow()"></td>';

  console.log(html);
  const para = document.createElement("tr");
  para.innerHTML = html;
  document.getElementById("main-table").appendChild(para);
}

initTable();

function removeRow(button) {
  var element = button.parentNode.parentNode;
  element.remove();
}

function addRow() {
  const addRowSelect = document.getElementById("name-to-add");
  const itemToAdd = document.getElementById("item-to-add").value.trim();
  const nameToAdd = addRowSelect.options[addRowSelect.selectedIndex].text;
  const priceToAdd = document.getElementById("price-to-add").value.trim();

  removeRow(document.getElementById("add-newrow"));

  const para = document.createElement("tr");
  var ptr = document.createElement("td");
  ptr.textContent = itemToAdd;
  para.appendChild(ptr);

  ptr = document.createElement("td");
  ptr.textContent = nameToAdd;
  para.appendChild(ptr);

  ptr = document.createElement("td");
  ptr.textContent = priceToAdd;
  para.appendChild(ptr);

  ptr = document.createElement("td");
  ptr.innerHTML =
    '<input class="delete-row" type="button" onclick = "removeRow(this)" value="ลบ">';
  para.appendChild(ptr);

  document.getElementById("main-table").appendChild(para);
  generateFormRow();
}

function generateFormRow() {
  const para = document.createElement("tr");
  para.innerHTML =
    '<td><input id = "item-to-add" type="text"></td><td><select id="name-to-add"><option> -- เลือกผู้ฝากซื้อ -- </option><option>ปุญญพัฒน์ สุรเกียรติกำจร</option><option>ศุภฤกษ์ คงประพันธ์</option><option>วชิรวิชญ์ กานิล</option><option>ภูภิพัทธ์ สิงขร</option></select></td><td><input type="number" id="price-to-add"></td><td><input id="add-newrow" type="button" value="เพิ่ม" onclick="addRow()"></td>';
  document.getElementById("main-table").appendChild(para);
}
