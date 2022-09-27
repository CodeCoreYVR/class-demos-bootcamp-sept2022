const QRCode = require('qrcode')

const fileName = process.argv[2]
const text = process.argv[3]

QRCode.toFile(`${fileName}.png`, text, error => {
  console.log(`QR code saved to ${fileName}`);
})