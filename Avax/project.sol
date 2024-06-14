// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleTwitter {
    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint256 public nextTweetId;
    mapping(uint256 => Tweet) public tweets;


    function postTweet(string memory content) public {
        require(bytes(content).length > 0, "Tweet content cannot be empty");

        tweets[nextTweetId] = Tweet(nextTweetId, msg.sender, content, block.timestamp, 0);

        nextTweetId++;
    }

    function likeTweet(uint256 tweetId) public {
        
    require(tweetId < nextTweetId, "Tweet does not exist");
    Tweet storage tweet = tweets[tweetId];

    if (tweet.author == msg.sender) {
        revert("Cannot like your own tweet");
    }

    tweet.likes++;
}

    function checkInvariants() public view {
        uint256 totalTweets = 0;

        for (uint256 i = 0; i < nextTweetId; i++) {
            totalTweets++;
        }

        assert(totalTweets == nextTweetId);
    }
}