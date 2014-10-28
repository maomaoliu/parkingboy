require 'spec_helper'

describe 'Ticket' do
  context 'given sub_parking_lot_id and carport_id' do
    let(:ticket) { Ticket.new(5, 6) }
    specify { expect(ticket.id).to eq('5/6') }
  end

  context 'given a ticket id' do
    let(:ticket_id) { '11/222' }
    subject(:ticket) { Ticket.find(ticket_id) }
    specify { expect(ticket.sub_parking_lot_id).to eq(11) }
    specify { expect(ticket.carport_id).to eq(222) }
  end
end