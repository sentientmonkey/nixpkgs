{ lib
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, requests
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pynuki";
  version = "1.5.2";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "pschmitt";
    repo = pname;
    rev = version;
    hash = "sha256-Uqw1Xa0pBQmQsFEBv/l1gtsPy+owYcTZITOYUmMvT5Y=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    requests
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [
    "pynuki"
  ];

  meta = with lib; {
    description = "Python bindings for nuki.io bridges";
    homepage = "https://github.com/pschmitt/pynuki";
    license = with licenses; [ gpl3Only ];
    maintainers = with maintainers; [ fab ];
  };
}
