pragma solidity >=0.5.5;

contract Tether {
    string public name = 'Mock Tether Token';
    string public symbol = 'mUSDT';
    uint256 public totalSupply = 1000000000000000000000000; // 1 million tokens
    // ETH has 18 decimals, same with DAI, Tether(USDT)
    uint8 public decimals = 18;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    // mapping is a key => store value
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor () {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        // require the value is greater or equal to the value that is transfering 
        require(balanceOf[msg.sender] >= _value);
        // subtract the value from the balance
        balanceOf[msg.sender] -= _value;
        // add the value to the new address
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // require the value is less then the balance of the address its being removed from
        require(_value <= balanceOf[_from]);
        // require the value is also lower then the allowance
        require(_value <= allowance[_from][msg.sender]);
        // add to the address that is coins are sent to
        balanceOf[_to] += _value;
        // remove from the address of the address sending
        balanceOf[_from] -= _value;
        // remove from the allowance
        allowance[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
    
}