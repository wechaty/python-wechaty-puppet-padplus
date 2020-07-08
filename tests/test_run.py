from padplus_grpc.PadPlusServer import PadPlusServerStub, ApiType, RequestObject
from grpclib.client import Channel
import asyncio
endpoint = 'padplus.juzibot.com:50051'
token = 'puppet_padplus_token'


async def run():
    channel = Channel(host='padplus.juzibot.com', port=50051)
    puppet_stub = PadPlusServerStub(channel)
    async for response in puppet_stub.init(token=token):
        # 一直卡在这里，没有收到消息
        # 所以怎么来获取事件，登录呢？这里有点疑惑
        print(response)

    # 这里应该是需要有一定的信息从init响应中返回
    response = await puppet_stub.request(
        RequestObject(token=token, api_type=ApiType.INIT)
    )
    print(response)

    channel.close()




asyncio.run(run())
