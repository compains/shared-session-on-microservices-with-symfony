vcl 4.0;

backend app1 {
  .host = "app1";
  .port = "80";
  .max_connections = 300;

  .first_byte_timeout     = 300s;
  .connect_timeout        = 5s;
  .between_bytes_timeout  = 2s;
}

backend app2 {
  .host = "app2";
  .port = "80";
  .max_connections = 300;

  .first_byte_timeout     = 300s;
  .connect_timeout        = 5s;
  .between_bytes_timeout  = 2s;
}

sub vcl_recv {
  set req.backend_hint = app1;

   if(req.url ~ "^\/app2-test-user"){
       set req.backend_hint = app2;
  }

  return (pass);
}