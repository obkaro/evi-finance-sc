import 'dart:convert';

class MonoReauthHtml {
  static build(String key, String reference, String token,
          [Map<String, dynamic> config]) =>
      '''<!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Mono Connect</title>
    </head>
    <body onload="setupMonoConnect()" style="background-color:#fff;height:100vh;overflow: scroll;">
      <script src="https://connect.withmono.com/connect.js"></script>
      <script type="text/javascript">
        window.onload = setupMonoConnect;
        function setupMonoConnect() {
          const options = {
             reference: "$reference",
            onSuccess:  (data) => {
              const response = {"type":"mono.modal.linked", response: {...data}}
              MonoClientInterface.postMessage(JSON.stringify(response))
            },
             onEvent: (eventName, data) => {
             const response = { type: 'onEvent', eventName, data }
              MonoClientInterface.postMessage(JSON.stringify(response))
            },
            onClose: ()=> {
              const response = {type: 'mono.modal.closed', }
              MonoClientInterface.postMessage(JSON.stringify(response))
            },
              onLoad: ()=> {
              const response = {type: 'mono.modal.onLoad', }
              MonoClientInterface.postMessage(JSON.stringify(response))
            }
          };
          const MonoConnect = new Connect("$key", options);
          const configJson = JSON.parse(`${jsonEncode(config ?? {})}`)

          MonoConnect.reauthorise($token);
          MonoConnect.open()
        }
      </script>
    </body>
</html>''';
}
