$(document).ready(function() {
    
    var baseConfig = {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Overlap Histogram'
        },
        yAxis: {
            title: {
                text: 'Count'
            }
        },

    };

    function get_values(element_id, data_attribute) {
        var values = $("#" + element_id).data(data_attribute);
        return values;
    }

    function set_data(element_id) {
        var xaxis = get_values(element_id, 'xaxis');
        var yaxis = get_values(element_id, 'yaxis');

        var data = {
            xAxis: {
                categories: xaxis
            },
            series: [{
                name: 'Overlap',
                data: yaxis
            }]
        };
        return data;
    }

    var data1 = set_data('analysis-group-overlap-data');
    var data2 = set_data('all-overlap-data');
        

    $('#analysis-group-overlap-chart').highcharts(
        $.extend(baseConfig, data1)
    );
    
    $('#all-overlap-chart').highcharts(
        $.extend(baseConfig, data2)
    );
    
});