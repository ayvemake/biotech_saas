import Quagga from '@ericblade/quagga2';

const startScanner = () => {
  console.log('Scanner starting...'); // Debug mobile
  Quagga.init({
    inputStream: {
      name: "Live",
      type: "LiveStream",
      target: document.querySelector("#interactive"),
      constraints: {
        facingMode: "environment" // Utilise la caméra arrière
      },
    },
    decoder: {
      readers: ["ean_reader", "ean_8_reader", "code_128_reader", "code_39_reader"]
    }
  }, function(err) {
    if (err) {
      console.error('Scanner error:', err); // Debug mobile
      return;
    }
    console.log("QuaggaJS initialization succeeded");
    Quagga.start();
  });

  Quagga.onDetected((result) => {
    const code = result.codeResult.code;
    document.getElementById('barcode-result').value = code;
    // Optionnel : arrêter la caméra après détection
    Quagga.stop();
  });
};

document.addEventListener('turbo:load', () => {
  const scanButton = document.getElementById('start-scan');
  if (scanButton) {
    scanButton.addEventListener('click', startScanner);
  }
}); 