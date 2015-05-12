$(document).ready(function() {
    
    var baseConfig = {
        chart: {
            type: 'column'
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

    function set_data(element_id, title) {
        var xaxis = get_values(element_id, 'xaxis');
        var yaxis = get_values(element_id, 'yaxis');

        var data = {
            xAxis: {
                categories: xaxis
            },
            title: {
                text: title
            },
            series: [{
                name: 'Overlap',
                data: yaxis
            }]
        };
        return data;
    }
        

    $('#analysis-group-overlap-chart-1').highcharts(
        $.extend(baseConfig, set_data('analysis-group-overlap-data-1', 'Analysis Group'))
    );

    $('#analysis-group-overlap-chart-2').highcharts(
        $.extend(baseConfig, set_data('analysis-group-overlap-data-2', 'Analysis Group'))
    );
    
    $('#all-overlap-chart-1').highcharts(
        $.extend(baseConfig, set_data('all-overlap-data-1', 'All Records'))
    );

    $('#all-overlap-chart-2').highcharts(
        $.extend(baseConfig, set_data('all-overlap-data-2', 'All Records'))
    );

    $('#analysis-group-interlibrary-loan-data').highcharts(
        $.extend(baseConfig, set_data('analysis-group-interlibrary-loan-data', 'Analysis Group'))
    );
    
    $('#all-interlibrary-loan-data').highcharts(
        $.extend(baseConfig, set_data('all-interlibrary-loan-data', 'All Records'))
    );

    $('#analysis-group-circulation-data').highcharts(
        $.extend(baseConfig, set_data('analysis-group-circulation-data', 'Analysis Group'))
    );

    $('#all-circulation-data').highcharts(
        $.extend(baseConfig, set_data('all-circulation-data', 'All Records'))
    );

});