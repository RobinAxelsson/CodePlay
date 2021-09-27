# Rebus Capture the Flag
## Instructions
You are decoding an english sentence of four words that is connected to the presentation.

## The encoded message:
🌎,dmFyaWFibGVz,R,🧊

## Send Attempt to Azure Function Cosmos Db:

```bash
# This is a GET-request
curl "https://azurectf-yh4.azurewebsites.net/api/HttpLinks?code=fYd5aVzdRWhNNqc4UKyNwN6nfLd0rzzZf9WBJGV2Sqtxp1mIOO/waw==&name=Bobban&answer=my,answer,is,smart"

# Response
$ Your answer was accepted... But none of the words matched, you are welcome to try again!
```

### Type of Responses:

- Some words match - you will see which do
- Invalid format
- Accepted answer but no matches
- Flag
### ctf_{th1s_i5_A_flag}
