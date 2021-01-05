package randomx_test

import (
	"encoding/hex"
	"testing"

	"github.com/sammy007/monero-stratum/randomx"
)

func TestRandomxHash(t *testing.T) {
	var r randomx.Randomx
	r.Init("da4e1226136cc8357a14e94c63dcf356c74c1a897b39a7021f034516faec2c06")
	input, _ := hex.DecodeString("0c0cfef9cdf505ec28dc29db63e7ff6ca24139a4ab10ffb8b92eb3477abe4978eb425a76b0dabf2d1b00008f80808ff820be93b4e08c2df2bce57a87cfdfa4235d6dd0e52edeba7d6feda209")
	hashBytes := r.CalcHash(input)
	t.Log("randomx hash test: ", hex.EncodeToString(hashBytes))
	if hex.EncodeToString(hashBytes) != "c6feefec6fed177cd41e35c5daa85dd16c43cfef68df0b4a3cef2b26b96b0000" {
		t.Fail()
	}
}
