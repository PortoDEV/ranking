window.addEventListener("message", (event) => {
    let data = event.data

    if (data.open) {
        $('body').css('display', 'block')

        fetch(`https://ranking/giveInitial`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
            })
        })
    }

    if (data.table) {
        var objMap = new Map(Object.entries(data.table));
        $('tbody').empty()
        objMap.forEach((item, key) => {
            key = Number(key) + 1
            $("tbody").append(`
            <tr class="font">
                <th scope="row" >${key}</th>
                <td>${item.id}</td>
                <td>${item.nome}</td>
                <td>${item.meta}</td>
            </tr>
            `)
        });
    }
})

document.onkeyup = function (data) {
    if (data.which == 27) {
        fetch(`https://ranking/closeNUI`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
            })
        })
        $('body').css('display', 'none')
    }
};

