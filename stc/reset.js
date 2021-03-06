function resetPassword() {
    $("error").innerHTML = "";
    $("validate").style.display = "none";

    try {
        var fields = ["email", "password"];
        var error = "";

        fields.each(function (field) {
            $(field).style.backgroundColor = "#fff";
        });

        fields.each(function (field) {
            if ($(field).value == "") {
                $(field).style.backgroundColor = "#fbb";
                error += "Field " + field + " must be non-empty<br>";
            }
        });

        if (error != "") {
            throw error;
        }

        $("userinfo").request({
            method:"post",
            onSuccess: function(transport) {
                state = transport.responseText.evalJSON();
                if (state.error.length) {
                    $("error").innerHTML = state.error.join("<br>");
                } else {
                    $("validate").style.display = "block";
                    $("usage").style.display = "none";
                }
            }
        });    
    } catch (e) {
        handleException(e);
    }
}
