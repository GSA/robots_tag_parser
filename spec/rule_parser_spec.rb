require "spec_helper"

RSpec.describe RobotsTagParser::RuleParser do
  pending '.parse' do
    subject(:parse) { RobotsTagParser::RuleParser.parse(rule_string) }

    context 'when the rule string includes a user agent' do
      let(:rule_string) { 'mybot: noindex' }

      it 'sets the user agent as the key' do
        expect(parse).to eq( 'mybot' => ['noindex'] )
      end
    end

    context 'when the rule string does not include a user agent' do
      let(:rule_string) { 'noindex' }

      it 'sets "all" as the key' do
        expect(parse).to eq( 'all' => ['noindex'] )
      end
    end

    context 'when the rule string is not downcased' do
      let(:rule_string) { 'NOFOLLOW' }

      it 'downcases the rule' do
        expect(parse).to eq( 'all' => ['nofollow'] )
      end
    end

    context 'when the rule string includes multiple rules' do
      let(:rule_string) { 'mybot: noindex,nofollow' }

      it 'formats the rules as an array' do
        expect(parse).to eq( 'mybot' => ['noindex', 'nofollow'] )
      end

      context 'when the rules include whitespace' do
        let(:rule_string) { 'mybot: noindex, nofollow' }

        it 'removes the whitespace' do
          expect(parse).to eq( 'mybot' => ['noindex', 'nofollow'] )
        end
      end
    end
  end
end

