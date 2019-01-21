/**
 * File pamap_loader.js
 * @author Coder team of PA Vietnam
 * @link https://web30s.vn
 * @since 2017-12
 */
function mapInitialize(index) {
    try {
        var lat = pamap[index].inputLat.value;
        var lng = pamap[index].inputLng.value;

        var address = '';
        if (typeof pamap[index].inputAddr !== 'undefined' && pamap[index].inputAddr !== null) {
            address = pamap[index].inputAddr.value;
        }

        // Default PA Vietnam location
        if (lat === '' || lng === '' || lat === null || lng === null || lat === '0' || lng === '0') {
            lat = '10.777067';
            lng = '106.688700';
            address = 'Công ty P.A Việt Nam';
        }

        var zoom = 15;
        if (typeof pamap[index].inputZoom !== 'undefined' && pamap[index].inputZoom !== null && pamap[index].inputZoom.value.match(/^\d+$/)) {
            zoom = parseInt(pamap[index].inputZoom.value);
        }

        pamap[index].map = new google.maps.Map(pamap[index].map_canvas, {
            scrollwheel: false,
            zoom: zoom,
            center: new google.maps.LatLng(lat, lng),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var latLng = new google.maps.LatLng(lat, lng);
        pamap[index].marker = new google.maps.Marker({
            map: pamap[index].map,
            position: latLng,
            draggable: !pamap[index].readonly
        });
        pamap[index].map.setCenter(latLng);

        pamap[index].infoWindow = new google.maps.InfoWindow;
        pamap[index].infoWindow.setContent('<span id="address"><b>Địa chỉ:</b> ' + address + '</span>');
        pamap[index].infoWindow.open(pamap[index].map, pamap[index].marker);

        if (!pamap[index].readonly) {
            google.maps.event.addListener(pamap[index].map, 'click', function (event) {
                placeMarker(index, event.latLng);
            });

            google.maps.event.addListener(pamap[index].map, 'zoom_changed', function () {
                if (typeof pamap[index].inputZoom !== 'undefined' && pamap[index].inputZoom !== null) {
                    pamap[index].inputZoom.value = pamap[index].map.getZoom();
                }
            });

            google.maps.event.addListener(pamap[index].marker, 'dragstart', function () {
                if (pamap[index].infoWindow !== null) {
                    pamap[index].infoWindow.close();
                }
            });

            google.maps.event.addListener(pamap[index].marker, 'dragend', function () {
                getAddress(index);
            });
        }

        pamap[index].geocoder = new google.maps.Geocoder;
    } catch (error) {
        console.error(error);
    }
}

function placeMarker(index, address) {
    try {
        pamap[index].marker.setMap(null);
        pamap[index].marker = new google.maps.Marker({position: address, map: pamap[index].map, draggable: true});
        google.maps.event.addListener(pamap[index].marker, 'dragstart', function () {
            if (pamap[index].infoWindow !== null) {
                pamap[index].infoWindow.close();
            }
        });

        google.maps.event.addListener(pamap[index].marker, 'dragend', function () {
            getAddress(index);
        });
        pamap[index].map.setCenter(address);
        getAddress(index);
    } catch (error) {
        console.error(error);
    }
}

function getAddress(index, address) {
    try {
        var position = pamap[index].marker.getPosition();
        var lat = position.lat();
        var lng = position.lng();
        pamap[index].inputLat.value = lat;
        pamap[index].inputLng.value = lng;
        var latLng = new google.maps.LatLng(lat, lng);
        pamap[index].geocoder.geocode({latLng: latLng}, function (result, status) {
            if (status !== google.maps.GeocoderStatus.OK || result === null || result[0] === null) {
                console.error('getAddress: Could not load map.');
                console.log(result);
                console.log(status);
                return;
            }

            if (typeof pamap[index].inputAddr !== 'undefined' && pamap[index].inputAddr !== null && pamap[index].inputAddr.readOnly) {
                pamap[index].inputAddr.value = result[0].formatted_address;
            }
            if (pamap[index].infoWindow !== null) {
                if (typeof address === 'undefined' || address === '') {
                    address = result[0].formatted_address;
                }
                pamap[index].infoWindow.setContent('<span id="address"><b>Địa chỉ:</b> ' + address + '</span>');
                pamap[index].infoWindow.open(pamap[index].map, pamap[index].marker);
            }
            var callback = pamap[index].map_canvas.getAttribute('data-onmark');
            if (typeof window[callback] === 'function') {
                window[callback](result[0].formatted_address);
            }
        });
        pamap[index].map.setCenter(position);
    } catch (error) {
        console.error(error);
    }
}

/**
 * Load the map location by address, position (lat, lng) or zoom
 * Default is address
 * @param input
 * @param type
 */
function showLocation(input, type) {
    if (typeof input === 'string') {
        input = document.querySelector(input);
    }
    if (!(input instanceof HTMLInputElement)) {
        console.error('showLocation: parameter input must be a input tag or string selector.');
        console.log(input);
        return;
    }

    var index = document.querySelector('[data-id-' + type + '="' + input.id + '"]').id.replace('map_canvas-', '');

    if (type === 'zoom') {
        pamap[index].map.setZoom(parseInt(input.value));
        return;
    }

    var address = input.value;
    var geocodeOption = {address: address};
    if (type === 'lat' || type === 'lng') {
        var latLng = new google.maps.LatLng(pamap[index].inputLat.value, pamap[index].inputLng.value);
        geocodeOption = {latLng: latLng};
    } else if (geocodeOption.address === '') {
        console.log('showLocation: skip.');
        return;
    }

    if (pamap[index].marker !== null) {
        pamap[index].marker.setMap(null);
    }
    pamap[index].geocoder.geocode(geocodeOption, function (result, status) {
        if (status !== google.maps.GeocoderStatus.OK || result === null || result[0] === null) {
            console.error('showLocation: Could not load map.');
            console.log(result);
            console.log(status);
            return;
        }

        pamap[index].map.setCenter(result[0].geometry.location);
        pamap[index].marker = new google.maps.Marker({
            map: pamap[index].map,
            position: result[0].geometry.location,
            draggable: true
        });
        pamap[index].inputLat.value = result[0].geometry.location.lat();
        pamap[index].inputLng.value = result[0].geometry.location.lng();
        if (pamap[index].infoWindow !== null) {
            if (type === 'lat' || type === 'lng') {
                address = result[0].formatted_address;
            }
            pamap[index].infoWindow.setContent('<span id="address"><b>Địa chỉ : </b>' + address + '</span>');
            pamap[index].infoWindow.open(pamap[index].map, pamap[index].marker);
        }
        var callback = pamap[index].map_canvas.getAttribute('data-onmark');
        if (typeof window[callback] === 'function') {
            window[callback](result[0].formatted_address);
        }

        google.maps.event.addListener(pamap[index].marker, 'dragstart', function () {
            if (pamap[index].infoWindow !== null) {
                pamap[index].infoWindow.close();
            }
        });
        google.maps.event.addListener(pamap[index].marker, 'dragend', function () {
            getAddress(index);
        });
    });
}

var pamap = [];
$(function() {
    if (typeof _active_lang === 'undefined') {
        _active_lang = 'vn';
    }

    $.getScript('https://maps.google.com/maps/api/js?key=AIzaSyAKUuXw8s42trJRIlpJkkc9204AfUxlhcI&amp;libraries=places&amp;region=' + _active_lang + '&amp;language=' + _active_lang, function(){
        var map_canvas_arr = document.getElementsByClassName('map_canvas');
        for (var index in map_canvas_arr) {
            if (!map_canvas_arr.hasOwnProperty(index) || !index.match(/^\d+$/)) {
                continue;
            }

            pamap[index] = {
                map: null,
                marker: null,
                geocoder: null,
                infoWindow: null,
                map_canvas: map_canvas_arr[index],
                readonly: Boolean(map_canvas_arr[index].getAttribute('readonly')),
                inputLat: document.getElementById(map_canvas_arr[index].getAttribute('data-id-lat')),
                inputLng: document.getElementById(map_canvas_arr[index].getAttribute('data-id-lng')),
                inputAddr: document.getElementById(map_canvas_arr[index].getAttribute('data-id-addr')),
                inputZoom: document.getElementById(map_canvas_arr[index].getAttribute('data-id-zoom'))
            };

            mapInitialize(index);

            if (typeof pamap[index].inputLat !== 'undefined' && pamap[index].inputLat !== null) {
                pamap[index].inputLat.addEventListener('change', function () { showLocation(this, 'lat'); });
            }
            if (typeof pamap[index].inputLng !== 'undefined' && pamap[index].inputLng !== null) {
                pamap[index].inputLng.addEventListener('change', function () { showLocation(this, 'lng'); });
            }
            if (typeof pamap[index].inputAddr !== 'undefined' && pamap[index].inputAddr !== null) {
                pamap[index].inputAddr.addEventListener('change', function () { showLocation(this, 'addr'); });
            }
            if (typeof pamap[index].inputZoom !== 'undefined' && pamap[index].inputZoom !== null) {
                pamap[index].inputZoom.addEventListener('change', function () { showLocation(this, 'zoom'); });
            }

            var callback = pamap[index].map_canvas.getAttribute('data-onload');
            if (typeof window[callback] === 'function') {
                window[callback](pamap[index]);
            }
        }
    });
});
