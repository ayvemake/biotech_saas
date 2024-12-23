import { Controller } from "@hotwired/stimulus"
import Quagga from '@ericblade/quagga2'

export default class extends Controller {
  static targets = ["input", "video", "scanRegion"]

  connect() {
    console.log("Scanner controller connected")
  }

  startScanning() {
    console.log("Starting scanner...")
    this.scanRegionTarget.classList.remove("hidden")
    
    Quagga.init({
      inputStream: {
        name: "Live",
        type: "LiveStream",
        target: this.videoTarget,
        constraints: {
          facingMode: "environment" // Utilise la caméra arrière sur mobile
        },
      },
      decoder: {
        readers: ["ean_reader", "ean_8_reader", "code_128_reader", "code_39_reader"]
      }
    }, (err) => {
      if (err) {
        console.error("Scanner error:", err)
        return
      }
      console.log("Scanner initialized")
      Quagga.start()
    })

    Quagga.onDetected(this.onBarcodeDetected.bind(this))
  }

  stopScanning() {
    Quagga.stop()
    this.scanRegionTarget.classList.add("hidden")
  }

  onBarcodeDetected(result) {
    const code = result.codeResult.code
    console.log("Barcode detected:", code)
    this.inputTarget.value = code
    this.stopScanning()

    // Optionnel : Rechercher le produit via AJAX
    fetch(`/stock_items/scan?barcode=${code}`, {
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.product) {
        // Remplir automatiquement les champs du formulaire
        document.getElementById('stock_item_name').value = data.product.name
        document.getElementById('stock_item_reference').value = data.product.reference_number
        // ... autres champs ...
      }
    })
  }
} 