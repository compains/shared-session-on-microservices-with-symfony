vcl 4.0;
# import std;
# import directors;

backend app1 { # Define one backend
  .host = "app1";    # IP or Hostname of backend
  .port = "80";           # Port Apache or whatever is listening
  .max_connections = 300; # That's it

  .first_byte_timeout     = 300s;   # How long to wait before we receive a first byte from our backend?
  .connect_timeout        = 5s;     # How long to wait for a backend connection?
  .between_bytes_timeout  = 2s;     # How long to wait between bytes received from our backend?
}

backend app2 { # Define one backend
  .host = "app2";    # IP or Hostname of backend
  .port = "80";           # Port Apache or whatever is listening
  .max_connections = 300; # That's it

  .first_byte_timeout     = 300s;   # How long to wait before we receive a first byte from our backend?
  .connect_timeout        = 5s;     # How long to wait for a backend connection?
  .between_bytes_timeout  = 2s;     # How long to wait between bytes received from our backend?
}

//sub vcl_init {

  //new app1_dir = directors.round_robin();
  //app1_dir.add_backend(app1);

  //new app2_dir = directors.round_robin();
  //app1_dir.add_backend(app2);

//}

sub vcl_recv {
  set req.backend_hint = app1;

   if(req.url ~ "^\/app2-test-user"){
       set req.backend_hint = app2;
  }

  return (pass);
}