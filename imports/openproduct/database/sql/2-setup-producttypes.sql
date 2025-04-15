/*
 * Copyright 2015-2021 Ritense BV, the Netherlands.
 *
 * Licensed under EUPL, Version 1.2 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* add thema */
INSERT INTO public.producttypen_thema(id, uuid, gepubliceerd, aanmaak_datum, update_datum, naam, beschrijving, hoofd_thema_id)
VALUES (1, '41f71c2e-9e0c-4a1b-8d39-709669b256c2', true, now(), now(), 'Parkeren', 'Parkeren thema', null);

/* add schema */
INSERT INTO public.producttypen_jsonschema(id, naam, schema)
VALUES (1, 'parkeervergunning-verbruiksobject', '{
  "type": "object",
  "properties": {
    "uren": {
      "type": "number"
    }
  },
  "required": [
    "uren"
  ]
}'),
(2, 'parkeervergunning-dataobject', '{
  "type": "object",
  "properties": {
    "uren": {
      "type": "number"
    }
  },
  "required": [
    "uren"
  ]
}');

/* add uniform productnaam*/
INSERT INTO public.producttypen_uniformeproductnaam(id, uuid, naam, uri, is_verwijderd)
VALUES ( 1,'b747df47-5b72-401f-a0ad-86c3b251499f', 'parkeervergunning', 'parkeervergunning', false);

/* add producttype*/
INSERT INTO public.producttypen_producttype(id, uuid, gepubliceerd, aanmaak_datum, update_datum, code, toegestane_statussen, keywords, interne_opmerkingen, dataobject_schema_id, uniforme_product_naam_id, verbruiksobject_schema_id)
VALUES (1,'dee273e9-2aa8-40ae-84b7-cb7da3c075ba', true, now(), now(), 'PARKEREN', '{gereed}', '{parkeren, ibs}', '', 2, 1, 1);

/* add dmn config*/
INSERT INTO public.producttypen_dmnconfig(id, uuid, naam, tabel_endpoint)
VALUES ( 1, '3bc964a5-108d-430c-b7fb-6797bb17b6fd', 'watkanikregelen-parkeren', 'http://localhost:9000/engine-rest/decision-definition/key');

/* add actie*/
INSERT INTO public.producttypen_actie(id, uuid, naam, dmn_tabel_id, dmn_config_id, producttype_id)
VALUES ( 1,'082d143f-6a53-4e08-bc3c-0488b3b490e4', 'watkanikregelen-parkeren', 'alg-parkeren', 1, 1),
       ( 2,'2435b986-7742-4cef-91f2-e1162c2f19c9', 'watkanikregelen-belastingen', 'alg-belastingen', 1, 1);;

/* add parameter */
INSERT INTO public.producttypen_parameter(id, uuid, naam, waarde, producttype_id)
VALUES (1, '023ea1f2-8e8c-42d8-9bed-a4ad4edc03c2', 'paymentcategorie', 'parkeren', 1);

/* add contentelement */
INSERT INTO public.producttypen_contentelement(id, "order", uuid, producttype_id)
VALUES (1, 1, 'bcc4ba4e-8022-447f-8ffd-d65781a51d24', 1);

/* add contentlabel */
INSERT INTO public.producttypen_contentlabel(id, uuid, naam)
VALUES (1, '6d9cab7b-311e-44b7-828e-eabbdf139724', 'naam');

/* add contentelementtranslation */
INSERT INTO public.producttypen_contentelementtranslation(id, language_code, content, master_id)
VALUES (1, 'nl', 'test data', 1),
       (2, 'en', 'test data English', 1);

/* add contentelement_labels */
INSERT INTO public.producttypen_contentelement_labels(contentelement_id, contentlabel_id)
VALUES (1, 1);

/* add producttype_thema */
INSERT INTO public.producttypen_producttype_themas(producttype_id, thema_id)
VALUES (1, 1)
