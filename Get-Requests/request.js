const http = require("http");
const options = {
  hostname: "localhost",
  port: 8080,
  path: "/hello",
  method: "GET",
};

const req = http.request(options, (res) => {
  res.on("data", (d) => {
    process.stdout.write(d);
    process.stdout.write("\n");
  });
});

req.on("error", (error) => {
  console.error(error);
});

req.end();
