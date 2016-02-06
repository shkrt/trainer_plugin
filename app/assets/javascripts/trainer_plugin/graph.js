var submitBtn = "<button class='btn btn-default' id='report_btn'>Submit</button>";
var userSelect = "#report_user_select"
var reportTypes = {
  "Activity for all users": {
    url: "summ_act",
    req: "GET"
  },
  "Clicks for all users": {
    url: "summ_click",
    req: "GET"
  },
  "Clicks for selected user": {
    url: "user_clicks",
    req: "POST"
  },
  "Activity for selected user": {
    url: "user_stats",
    req: "POST"
  }
}

$(document).ready(function() {
  $("#report_form").after(submitBtn)
  HandleReportSelection($("#report_type").val());
  $("#report_type").on("change", function() {
    HandleReportSelection($(this).val());
  })
  $("#report_btn").on("click", function() {
    $("svg").remove();
    var type = $("#report_type").val();
    var uid = $("#user_id").val();
    ApiRequest(type, uid, function(result) {
      MakeReport(type, result)
    });
  })
});

function HandleReportSelection(v) {
  if (v === "Clicks for selected user" || v === "Activity for selected user") {
    ShowUserSelect();
  } else {
    HideUserSelect();
  }
}

function ShowUserSelect() {
  $(userSelect).show();
}

function HideUserSelect() {
  $(userSelect).hide();
}

function ApiRequest(t, id, callback) {
  var reqType = reportTypes[t]["req"];
  var values;

  if (reqType === "POST") {
    values = "&user_id=" + id
  }

  $.ajax({
    type: reqType,
    url: reportTypes[t]["url"],
    data: values,
    success: function(msg, status, jqXHR) {
      callback(msg);
    }
  })
}

function MakeReport(type, data) {
  if (type === "Activity for all users" || type === "Clicks for all users") {
    reportData = Transform(data);
    OverallReport(reportData.values, reportData.domain);
  } else {
    SingleReport(Transpose(data));
  }
}

function Transform(json) {
  var table = [];
  var axisNames = [];
  for (var key in json) {
    axisNames.push(key);
    for (var st in json[key]) {
      obj = {
        "link": st
      }
      obj[key] = (obj[key] === undefined) ? json[key][st] : obj[key] + json[key][st];
      MergeOrCreate(table, obj)
    }
  }
  return {
    "values": table,
    "domain": axisNames
  }
}

function Transpose(json) {
  var table = [];
  for (var key in json) {
    obj = {
      "tag": key,
      "count": json[key]
    };
    table.push(obj);
  }
  return table;
}

function MergeOrCreate(arr, hash) {
  var obj = arr.filter(function(obj) {
    return obj.link === hash.link
  })[0];
  if (obj === undefined) {
    arr.push(hash)
  } else {
    $.extend(obj, hash)
  }
}
