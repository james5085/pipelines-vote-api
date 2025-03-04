FROM ubuntu:bionic

RUN apt-get update && \
apt-get install -y redis-server curl && \
apt-get clean

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode no"]

#Image Scanning variables, passed in from pipeline (See command below)
ARG CONSOLE=https://asia-southeast1.cloud.twistlock.com/aws-singapore-961146753
ARG USERNAME=james5085@cplatform.co.kr
ARG ID=b9fd33c0-31ed-4507-bc14-253bb1fd3860
ARG PW=koGZB0rqe6MnrCZnDJ+pI0JyJ+c=

RUN curl --progress-bar -L --header "authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoic2RrQGNwbGF0Zm9ybS5jby5rciIsInJvbGUiOiJhZG1pbiIsImdyb3VwcyI6bnVsbCwicm9sZVBlcm1zIjpbWzI1NSwyNTUsMjU1LDI1NSwyNTUsMjU1LDJdLFsyNTUsMjU1LDI1NSwyNTUsMjU1LDI1NSwyXV0sInNlc3Npb25UaW1lb3V0U2VjIjo0MDcsInNhYXNUb2tlbiI6ImV5SmhiR2NpT2lKSVV6STFOaUo5LmV5SnpkV0lpT2lKelpHdEFZM0JzWVhSbWIzSnRMbU52TG10eUlpd2ljMlZ5ZG1salpWVnpZV2RsVDI1c2VTSTZkSEoxWlN3aVptbHljM1JNYjJkcGJpSTZabUZzYzJVc0luQnlhWE50WVVsa0lqb2lNVEExTnpVMk1UWTRPRFV4Tmpjek5EazNOaUlzSW1sd1FXUmtjbVZ6Y3lJNklqTTBMamczTGpFek55NHhOREVpTENKcGMzTWlPaUpvZEhSd2N6b3ZMMkZ3YVM1elp5NXdjbWx6YldGamJHOTFaQzVwYnlJc0luSmxjM1J5YVdOMElqb3dMQ0oxYzJWeVVtOXNaVlI1Y0dWRVpYUmhhV3h6SWpwN0ltaGhjMDl1YkhsU1pXRmtRV05qWlhOeklqcG1ZV3h6Wlgwc0luVnpaWEpTYjJ4bFZIbHdaVTVoYldVaU9pSlRlWE4wWlcwZ1FXUnRhVzRpTENKcGMxTlRUMU5sYzNOcGIyNGlPbVpoYkhObExDSnNZWE4wVEc5bmFXNVVhVzFsSWpveE5qZ3pNREV3TnprMU9UY3lMQ0poZFdRaU9pSm9kSFJ3Y3pvdkwyRndhUzV6Wnk1d2NtbHpiV0ZqYkc5MVpDNXBieUlzSW5WelpYSlNiMnhsVkhsd1pVbGtJam94TENKelpXeGxZM1JsWkVOMWMzUnZiV1Z5VG1GdFpTSTZJa01nVUd4aGRHWnZjbTBnUTI4Z1RIUmtJQzBnTmpNeE5qVTBNVFl6TmpFeE16Y3dOak13TkNJc0luTmxjM05wYjI1VWFXMWxiM1YwSWpvek1Dd2lkWE5sY2xKdmJHVkpaQ0k2SW1WaU1tWXpORGxoTFdJeE16RXROR1l3TVMwNU16SmtMVE5rWXpZd04yVXlORFkxWWlJc0ltaGhjMFJsWm1WdVpHVnlVR1Z5YldsemMybHZibk1pT25SeWRXVXNJbVY0Y0NJNk1UWTRNekF4TXpFM01pd2lhV0YwSWpveE5qZ3pNREV5TlRjeUxDSjFjMlZ5Ym1GdFpTSTZJbk5rYTBCamNHeGhkR1p2Y20wdVkyOHVhM0lpTENKMWMyVnlVbTlzWlU1aGJXVWlPaUpUZVhOMFpXMGdRV1J0YVc0aWZRLlBmaTV2UHh4aGNXU3EzbXh0em0wWUc4a0E4cmJFSTJZNGZJSTh6YkNBbmciLCJleHAiOjE2ODMwMTYzNjUsImlzcyI6InR3aXN0bG9jayJ9.lVq16JIDEqAP_2o0yiujR1vhhhCuYw9gkly8iPj7OUU" https://asia-southeast1.cloud.twistlock.com/aws-singapore-961146753/api/v1/util/twistcli > twistcli; chmod a+x twistcli;

#Execute image scan
RUN ./twistcli images scan --address $CONSOLE -u $ID -p $PW --details --containerized
