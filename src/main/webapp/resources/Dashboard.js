var pagenumber=0;
    $(document).ready(function () {

    $('#createtopicform').ajaxForm({

        success: function (msg) {
         alert(msg);
        },
        error: function (msg) {
            alert(msg);
        }
    });
    $('#sendInvitationForm').ajaxForm({

        success: function (msg) {
            alert(msg);

        },
        error: function (msg) {
            alert(msg);
        }
    });

        //attach autocomplete

    $('#changetopicnameform').ajaxForm({

        success: function (msg) {
            alert(msg);
            myFunction();
        },
        error: function (msg) {
            alert(msg);
        }
    });
    function myFunction() {
        location.reload();
    }
    $('#createdocumentedresourceform').ajaxForm({

        success: function (msg) {
            alert(msg);
        },
        error: function (msg) {
            alert(msg);
        }
    });


    $('#createlinkedresourceform').ajaxForm({

        success: function (msg) {
           alert(msg);
        },
        error: function (msg) {
            alert(msg);
        }

    });

    $('#sendSubscriptionInvitaition').ajaxForm({

        success: function (msg) {
            alert(msg);
        },
        error: function (msg) {
            alert(msg);
        }
    });
    //
    // var obj = $('#pagination').twbsPagination({
    //     totalPages:10,
    //     visiblePages: 5,
    //     onPageClick: function (event, page) {
    //         $("#inbox").html('');
    //         $.ajax({
    //             url:'fetchinbox?index='+page,
    //             method:"get",
    //             success:function (response) {
    //                 $('#inbox').append(response);
    //                 pagenumber=page;
    //             }
    //         })
    //         console.info(page);
    //     }
    //
    // });


    $('#topicsearchforlinkedresource').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
        , source: function (request, response) {
            $.ajax({
                url: "/fetchSubscribedTopics",
                data: {'term':request},
                dataType: "json",
                type: "Get",
                order: "asc",
                hint: true,
                contentType: "application/json; charset=utf-8",
                searchOnFocus: true,
                success: function (data) {
                    items = [];
                    map = {};
                    $.each(data, function (i, item) {
                        var id = item.topic.name;
                        // var name = item.topic.name+"-"+item.user.username;
                        // map[name] = { id: id, name: name };
                        items.push("topic name : "+item.topic.name+",  createdBy : "+item.user.username);
                    });
                    response(items);
                    $(".dropdown-menu").css("height", "auto");
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        }
        // updater: function (item) {
        //     $('[id*=hfCustomerId]').val(map[item].id);
        //     return item;
        // }
    });



    $('#topicsearchfordocumentresource').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
        , source: function (request, response) {
            $.ajax({
                url: "/fetchSubscribedTopics",
                data: {'term':request},
                dataType: "json",
                type: "Get",
                order: "asc",
                hint: true,
                contentType: "application/json; charset=utf-8",
                searchOnFocus: true,
                success: function (data) {
                    items = [];
                    map = {};
                    $.each(data, function (i, item) {
                        var id = item.topic.name;
                        // var name = item.topic.name+"-"+item.user.username;
                        // map[name] = { id: id, name: name };
                        items.push("topic name : "+item.topic.name+",  createdBy : "+item.user.username);
                    });
                    response(items);
                    $(".dropdown-menu").css("height", "auto");
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        }
        // updater: function (item) {
        //     $('[id*=hfCustomerId]').val(map[item].id);
        //     return item;
        // }
    });


    $('#topicsearchforlinkedresource').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
        , source: function (request, response) {
            $.ajax({
                url: "/fetchSubscribedTopics",
                data: {'term':request},
                dataType: "json",
                type: "Get",
                order: "asc",
                hint: true,
                contentType: "application/json; charset=utf-8",
                searchOnFocus: true,
                success: function (data) {
                    items = [];
                    map = {};
                    $.each(data, function (i, item) {
                        var id = item.topic.name;
                        // var name = item.topic.name+"-"+item.user.username;
                        // map[name] = { id: id, name: name };
                        items.push("topic name : "+item.topic.name+",  createdBy : "+item.user.username);
                    });
                    response(items);
                    $(".dropdown-menu").css("height", "auto");
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        }
        // updater: function (item) {
        //     $('[id*=hfCustomerId]').val(map[item].id);
        //     return item;
        // }
    });
    $("#TopicName").keyup(function () {
        $.ajax({
            url:"uniquetopiccheck?name="+$("#TopicName").val(),
            method:"Post",
            success :function (response) {
                if(response=="topic name available")
                {
                    $("#uniqueTopicname").text(response);
                    $('#createtopic').attr('disabled',false);
                }
                else
                {
                    $("#uniqueTopicname").text(response);
                    $('#createtopic').attr('disabled',true);
                }
            }
        })
    });





    $('#topicForSubscription').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
        , source: function (request, response) {
            $.ajax({
                url: "/fetchSubscribedTopics",
                data: {'term':request},
                dataType: "json",
                type: "Get",
                order: "asc",
                hint: true,
                contentType: "application/json; charset=utf-8",
                searchOnFocus: true,
                success: function (data) {
                    items = [];
                    map = {};
                    $.each(data, function (i, item) {
                        var id = item.topic.name;
                        // var name = item.topic.name+"-"+item.user.username;
                        // map[name] = { id: id, name: name };
                        items.push("topic name : "+item.topic.name+",  createdBy : "+item.user.username);
                    });
                    response(items);
                    $(".dropdown-menu").css("height", "auto");
                },
                error: function (response) {
                    alert(response.responseText);
                },
                failure: function (response) {
                    alert(response.responseText);
                }
            });
        }
        // updater: function (item) {
        //     $('[id*=hfCustomerId]').val(map[item].id);
        //     return item;
        // }
    });

    $('.unsubscribedd').on('click',function () {
        var v = $(this).attr('href');
        event.preventDefault();
        var i = $(this).children().text();
        var ref = this;
        if (i == 'unsubscribe') {
            $.ajax({
                url: "unsubscribeToTopic?tid=" + v,
                method: "get",
                success: function (response) {
                    alert(response);
                    $(ref).children().html("subscribe");
                },

            });
        }
        else {
            $.ajax({
                url: "subscribetotopic?tid=" + v,
                method: "get",
                success: function (response) {
                    alert(response);
                    $(ref).children().text('unsubscribe');
                },

            });

        }
    });

   });
function deletetopic(id) {
    $.ajax({
        url: "/deletetopic?tid=" + id,
        method: "get",
        success: function (response) {
            alert(response);
            if (response == "deleted successfully") {
               location.reload();
            }
        },
        failure: function (response) {
            alert(response);

        }
    })
}


        // Delete a defined entry



