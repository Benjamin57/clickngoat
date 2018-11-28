import "bootstrap";
import { toggleTab } from 'components/tab';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';


import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../components/init_mapbox';


toggleTab();
initSelect2();
initMapbox();

