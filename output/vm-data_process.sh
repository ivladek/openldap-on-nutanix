#!/bin/bash
echo "create vm-data.json file for RestAPI call to Nutanix Prism Central"
echo -e "\t{{CLUSTERname}}: "'ntnx-cluster1'
sed -i '' 's|{{CLUSTERname}}|ntnx-cluster1|g' output/vm-data.json
echo -e "\t{{CLUSTERuuid}}: "'0005e5f5-be85-0bcf-2fcb-1070fd2c0cb0'
sed -i '' 's|{{CLUSTERuuid}}|0005e5f5-be85-0bcf-2fcb-1070fd2c0cb0|g' output/vm-data.json
echo -e "\t{{VMname}}: "'ldap'
sed -i '' 's|{{VMname}}|ldap|g' output/vm-data.json
echo -e "\t{{VMcores}}: "'1'
sed -i '' 's|{{VMcores}}|1|g' output/vm-data.json
echo -e "\t{{VMram}}: "'1024'
sed -i '' 's|{{VMram}}|1024|g' output/vm-data.json
echo -e "\t{{VMdisk}}: "'5120'
sed -i '' 's|{{VMdisk}}|5120|g' output/vm-data.json
echo -e "\t{{VMimage}}: "'6a7a893c-78a4-4c7f-a496-8a58bd3e03f6'
sed -i '' 's|{{VMimage}}|6a7a893c-78a4-4c7f-a496-8a58bd3e03f6|g' output/vm-data.json
echo -e "\t{{VMip}}: "'10.2.10.31'
sed -i '' 's|{{VMip}}|10.2.10.31|g' output/vm-data.json
echo -e "\t{{VMnet}}: "'ntnx-core_ipam'
sed -i '' 's|{{VMnet}}|ntnx-core_ipam|g' output/vm-data.json
echo -e "\t{{VMnetuuid}}: "'a994d52c-e7ec-4c11-8428-0bd722b10964'
sed -i '' 's|{{VMnetuuid}}|a994d52c-e7ec-4c11-8428-0bd722b10964|g' output/vm-data.json
echo -e "\t{{USERdata_b64}}: from user-data"
sed -i '' 's|{{USERdata_b64}}|I2Nsb3VkLWNvbmZpZwoKZnFkbjogbGRhcC5pdmxhZGVrLmNvbQptYW5hZ2VfZXRjX2hvc3RzOiB0cnVlCnRpbWV6b25lOiBBc2lhL0FsbWF0eQoKdXNlcnM6CiAgLSBuYW1lOiBsZGFwLWFkbWluCiAgICBoYXNoZWRfcGFzc3dkOiAkNiRyb3VuZHM9NDA5NiQxRFRDOWp4N1RjeVZBLkZlJFNQUlE3MGtrLjJtZHFrR0tnR3dZZmN4NS4weVdLWkJGcjJkOVp6ZVF5VFdpWVVZLkVJR3JsLlZ3eExhbUJ5bGRBOXBRRk1rNUs4SURRdXNKcURtWWUvCiAgICBncm91cHM6IHN1ZG8KICAgIHNoZWxsOiAvYmluL2Jhc2gKICAgIHN1ZG86IFsnQUxMPShBTEwpIE5PUEFTU1dEOkFMTCddCiAgICBsb2NrLXBhc3N3ZDogZmFsc2UKCnNzaF9wd2F1dGg6IHRydWUKY2hwYXNzd2Q6CiAgZXhwaXJlOiBmYWxzZQoKd3JpdGVfZmlsZXM6CiAgLSBwYXRoOiAvaG9tZS9sZGFwLWFkbWluL3NsYXBkLWFuc3dlcnMxCiAgICBvd25lcjogbGRhcC1hZG1pbjpsZGFwLWFkbWluCiAgICBwZXJtaXNzaW9uczogJzA2NDAnCiAgICBlbmNvZGluZzogYjY0CiAgICBjb250ZW50OiBDbk5zWVhCa0lITnNZWEJrTDNKdmIzUmZjR0Z6YzNkdmNtUWdjR0Z6YzNkdmNtUWdhWFpzWVdSbGF6SXdNakl0VWs5UFZBcHpiR0Z3WkNCemJHRndaQzl5YjI5MFgzQmhjM04zYjNKa1gyRm5ZV2x1SUhCaGMzTjNiM0prSUdsMmJHRmtaV3N5TURJeUxWSlBUMVFLCiAgICBkZWZlcjogdHJ1ZQogIC0gcGF0aDogL2hvbWUvbGRhcC1hZG1pbi9zbGFwZC1hbnN3ZXJzMgogICAgb3duZXI6IGxkYXAtYWRtaW46bGRhcC1hZG1pbgogICAgcGVybWlzc2lvbnM6ICcwNjQwJwogICAgZW5jb2Rpbmc6IGI2NAogICAgY29udGVudDogQ25Oc1lYQmtJSE5zWVhCa0wybHVkR1Z5Ym1Gc0wyRmtiV2x1Y0hjZ2NHRnpjM2R2Y21RZ2FYWnNZV1JsYXpJd01qSXRRVVJOU1U0S2MyeGhjR1FnYzJ4aGNHUXZhVzUwWlhKdVlXd3ZaMlZ1WlhKaGRHVmtYMkZrYldsdWNIY2djR0Z6YzNkdmNtUWdhWFpzWVdSbGF6SXdNakl0UVVSTlNVNEtjMnhoY0dRZ2MyeGhjR1F2Y0dGemMzZHZjbVF4SUhCaGMzTjNiM0prSUdsMmJHRmtaV3N5TURJeUxWSlBUMVFLYzJ4aGNHUWdjMnhoY0dRdmNHRnpjM2R2Y21ReUlIQmhjM04zYjNKa0lHbDJiR0ZrWldzeU1ESXlMVkpQVDFRS2MyeGhjR1FnYzJ4aGNHUXZaRzl0WVdsdUlITjBjbWx1WnlCcGRteGhaR1ZyTG1OdmJRcHpiR0Z3WkNCemFHRnlaV1F2YjNKbllXNXBlbUYwYVc5dUlITjBjbWx1WnlCSmRteGhaR1ZySUhGUWIzSjBDbk5zWVhCa0lITnNZWEJrTDJKaFkydGxibVFnYzNSeWFXNW5JRWhFUWdwemJHRndaQ0J6YkdGd1pDOXdkWEpuWlY5a1lYUmhZbUZ6WlNCaWIyOXNaV0Z1SUhSeWRXVUtjMnhoY0dRZ2MyeGhjR1F2Ylc5MlpWOXZiR1JmWkdGMFlXSmhjMlVnWW05dmJHVmhiaUIwY25WbENuTnNZWEJrSUhOc1lYQmtMMkZzYkc5M1gyeGtZWEJmZGpJZ1ltOXZiR1ZoYmlCbVlXeHpaUXB6YkdGd1pDQnpiR0Z3WkM5dWIxOWpiMjVtYVdkMWNtRjBhVzl1SUdKdmIyeGxZVzRnWm1Gc2MyVUsKICAgIGRlZmVyOiB0cnVlCiAgLSBwYXRoOiAvaG9tZS9sZGFwLWFkbWluL2xkYXAtcm9vdAogICAgb3duZXI6IGxkYXAtYWRtaW46bGRhcC1hZG1pbgogICAgcGVybWlzc2lvbnM6ICcwNjQwJwogICAgZW5jb2Rpbmc6IGI2NAogICAgY29udGVudDogYVhac1lXUmxhekl3TWpJdFVrOVBWQT09CiAgICBkZWZlcjogdHJ1ZQogIC0gcGF0aDogL2hvbWUvbGRhcC1hZG1pbi9sZGFwLXRscy5sZGlmCiAgICBvd25lcjogbGRhcC1hZG1pbjpsZGFwLWFkbWluCiAgICBwZXJtaXNzaW9uczogJzA2NDAnCiAgICBlbmNvZGluZzogYjY0CiAgICBjb250ZW50OiBDa1JPT2lCRFRqMWpiMjVtYVdjS1kyaGhibWRsZEhsd1pUb2diVzlrYVdaNUNuSmxjR3hoWTJVNklHOXNZMVJNVTBOQlEyVnlkR2xtYVdOaGRHVkdhV3hsQ205c1kxUk1VME5CUTJWeWRHbG1hV05oZEdWR2FXeGxPaUF2WlhSakwyeGtZWEF2YzJGemJESXZiR1JoY0M1cGRteGhaR1ZyTG1OdmJTNWpjblFLTFFweVpYQnNZV05sT2lCdmJHTlVURk5EWlhKMGFXWnBZMkYwWlVacGJHVUtiMnhqVkV4VFEyVnlkR2xtYVdOaGRHVkdhV3hsT2lBdlpYUmpMMnhrWVhBdmMyRnpiREl2YkdSaGNDNXBkbXhoWkdWckxtTnZiUzVqY25RS0xRcHlaWEJzWVdObE9pQnZiR05VVEZORFpYSjBhV1pwWTJGMFpVdGxlVVpwYkdVS2IyeGpWRXhUUTJWeWRHbG1hV05oZEdWTFpYbEdhV3hsT2lBdlpYUmpMMnhrWVhBdmMyRnpiREl2YkdSaGNDNXBkbXhoWkdWckxtTnZiUzVyWlhrSwogICAgZGVmZXI6IHRydWUKICAtIHBhdGg6IC9ob21lL2xkYXAtYWRtaW4vbGRhcC1pbml0LmxkaWYKICAgIG93bmVyOiBsZGFwLWFkbWluOmxkYXAtYWRtaW4KICAgIHBlcm1pc3Npb25zOiAnMDY0MCcKICAgIGVuY29kaW5nOiBiNjQKICAgIGNvbnRlbnQ6IENrUk9PaUJQVlQxMWMyVnljeXhFUXoxcGRteGhaR1ZyTEVSRFBXTnZiUXB2WW1wbFkzUkRiR0Z6Y3pvZ2IzSm5ZVzVwZW1GMGFXOXVZV3hWYm1sMENtOWlhbVZqZEVOc1lYTnpPaUIwYjNBS1QxVTZJSFZ6WlhKekNncEVUam9nVDFVOVozSnZkWEJ6TEVSRFBXbDJiR0ZrWldzc1JFTTlZMjl0Q205aWFtVmpkRU5zWVhOek9pQnZjbWRoYm1sNllYUnBiMjVoYkZWdWFYUUtiMkpxWldOMFEyeGhjM002SUhSdmNBcFBWVG9nWjNKdmRYQnpDZz09CiAgICBkZWZlcjogdHJ1ZQoKcGFja2FnZV91cGRhdGU6IHRydWUKcGFja2FnZV91cGdyYWRlOiB0cnVlCnBhY2thZ2VzOgogIC0gdWZ3CiAgLSBkZWJjb25mLXV0aWxzCiAgLSBsZGFwLXV0aWxzCiAgLSBhcGFjaGUyCiAgLSBwaHAKICAtIHBocC1jZ2kKICAtIGxpYmFwYWNoZTItbW9kLXBocAogIC0gcGhwLW1ic3RyaW5nCiAgLSBwaHAtY29tbW9uCiAgLSBwaHAtcGVhcgogIC0gbGRhcC1hY2NvdW50LW1hbmFnZXIKcnVuY21kOgojIHNldCBob3N0bmFtZSB0byBmcWRuCiAgLSBob3N0bmFtZWN0bCBzZXQtaG9zdG5hbWUgbGRhcC5pdmxhZGVrLmNvbQojIG9wZW4gZmlyZXdhbGwgcG9ydHMgLSBzc2gsIGxkYXAocyksIGh0dHAocykKICAtIHVmdyBhbGxvdyAyMi90Y3AKICAtIHVmdyBhbGxvdyAzODkvdGNwCiAgLSB1ZncgYWxsb3cgNjg2L3RjcAogIC0gdWZ3IGFsbG93IDgwL3RjcAogIC0gdWZ3IGFsbG93IDQ0My90Y3AKICAtIHVmdyAtLWZvcmNlIGVuYWJsZQojIGFsbG93IHBocCBjZ2kgZm9yIGFwYWNoZQogIC0gYTJlbmNvbmYgcGhwKi1jZ2kKICAtIHN5c3RlbWN0bCByZWxvYWQgYXBhY2hlMgojIHNsYXBkIHNpbGVudCBpbnN0YWxsYXRpb24KICAtIGNhdCAvaG9tZS9sZGFwLWFkbWluL3NsYXBkLWFuc3dlcnMxIHwgZGViY29uZi1zZXQtc2VsZWN0aW9ucwogIC0gREVCSUFOX0ZST05URU5EPW5vbmludGVyYWN0aXZlIGFwdCAteSBpbnN0YWxsIHNsYXBkCiAgLSBjYXQgL2hvbWUvbGRhcC1hZG1pbi9zbGFwZC1hbnN3ZXJzMiB8IGRlYmNvbmYtc2V0LXNlbGVjdGlvbnMKICAtIERFQklBTl9GUk9OVEVORD1ub25pbnRlcmFjdGl2ZSBkcGtnLXJlY29uZmlndXJlIHNsYXBkCiMgZ2VuZXJhdGUgc2VsZiBzaWduZWQgY2VydGlmaWNhdGUgZm9yIGxkYXBzCiAgLSBvcGVuc3NsIHJlcSAtbmV3a2V5IHJzYTo0MDk2IC14NTA5IC1ub2RlcyAtb3V0IC9ldGMvbGRhcC9zYXNsMi9sZGFwLml2bGFkZWsuY29tLmNydCAta2V5b3V0IC9ldGMvbGRhcC9zYXNsMi9sZGFwLml2bGFkZWsuY29tLmtleSAtZGF5cyA1MDAwIC1zdWJqICJDPUtaLCBMPUFsbWF0eSwgTz1JdmxhZGVrIHFQb3J0LCBPVT1MREFQIFNlcnZlciwgQ049bGRhcC5pdmxhZGVrLmNvbSIKICAtIGNob3duIG9wZW5sZGFwOm9wZW5sZGFwIC9ldGMvbGRhcC9zYXNsMi9sZGFwLml2bGFkZWsuY29tLioKIyBjbGVhciBhbGwgd2hpdGUgc3BhY2UgZnJvbSBwc2Fhd29yZCBmaWxlCiAgLSBlY2hvIC1uICIkKGNhdCAvaG9tZS9sZGFwLWFkbWluL2xkYXAtcm9vdCB8IHRyIC1kICdbOnNwYWNlOl0nKSIgPiAvaG9tZS9sZGFwLWFkbWluL2xkYXAtcm9vdAojIGNyZWF0ZSBiYXNlIE9VCiAgLSBsZGFwYWRkIC14IC1EIENOPWFkbWluLERDPWl2bGFkZWssREM9Y29tIC15IC9ob21lL2xkYXAtYWRtaW4vbGRhcC1yb290IC1mIC9ob21lL2xkYXAtYWRtaW4vbGRhcC1pbml0LmxkaWYKIyBlbmFibGUgbGRhcHMKICAtIGxkYXBtb2RpZnkgLVkgRVhURVJOQUwgLUggbGRhcGk6Ly8vIC1mIC9ob21lL2xkYXAtYWRtaW4vbGRhcC10bHMubGRpZgogIC0gc2VkIC1pICJzfF5TTEFQRF9TRVJWSUNFUy4qJHxTTEFQRF9TRVJWSUNFUz1cImxkYXA6Ly8vIGxkYXBzOi8vLyBsZGFwaTovLy9cInwiIC9ldGMvZGVmYXVsdC9zbGFwZAogIC0gc3lzdGVtY3RsIHJlc3RhcnQgc2xhcGQK|g' output/vm-data.json
