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
INSERT INTO public.authtoken_token (key, created, user_id)
VALUES ('ac045222c9e7cde8120b48735560f9b920bb58cd', now(), 1);

INSERT INTO public.zgw_consumers_service(id,label, api_type, api_root, client_id, secret, auth_type, header_key, header_value, oas, nlx, user_id, user_representation, oas_file, client_certificate_id, server_certificate_id, uuid, timeout, api_connection_check_path, slug)
VALUES (1, 'Openzaak Types', 'ztc', 'http://localhost:8001/catalogi/api/v1/', 'valtimo_client', 'e09b8bc5-5831-4618-ab28-41411304309d', 'zgw', '', '', 'http://localhost:8001/catalogi/api/v1', '', '', '', '', null, null, '415042b2-c740-4532-be88-38ac5f8c9060', 10, '', 'httplocalhost8001catalogiapiv1' );

/* add externe verwijzing config */
INSERT INTO public.producttypen_externeverwijzingconfig(id, zaaktypen_url, processen_url, verzoektypen_url, documenten_url)
VALUES (1, 'http://localhost:8001/catalogi/api/v1', 'http://localhost:8001/catalogi/api/v1', 'http://localhost:8001/catalogi/api/v1', 'http://localhost:8001/documenten/api/v1');



SELECT pg_catalog.setval('public.zgw_consumers_service_id_seq', 1, true);

SELECT pg_catalog.setval('public.producttypen_externeverwijzingconfig_id_seq', 1, true);
