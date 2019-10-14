const NumberWithDelimiter = (number) => {
    return String(number).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
}
$(function() {
    var price_field = $('#price-field');
    var charge_field = $('#charge');
    var benefit_field = $('#benefit')

    price_field.on("input", function() {
        var price = price_field.val();
        var benefit = Math.round(price * 0.9).toLocaleString();
        var charge = Math.round(price * 0.1).toLocaleString();
        charge_field.html(charge)
        charge_field.prepend('¥')
        benefit_field.html(benefit)
        benefit_field.prepend('¥')
    })
})